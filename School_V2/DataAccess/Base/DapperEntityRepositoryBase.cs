using Dapper;
using DataAccess.Abstract;
using Entities.Abstract;
using Entities.Concrete;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities.Constants;
using Utilities.Extensions;
using static Dapper.SqlMapper;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;


namespace DataAccess.Base
{
    public class DapperEntityRepositoryBase<TEntity> : IEntityRepository<TEntity>
        where TEntity : class, IEntity, new()
    {
        internal string? connectionString;
        public DapperEntityRepositoryBase()
        {
            connectionString = ContextConstant.DapperConnectionString;
        }
        public void Add(TEntity entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                //tablo ismini sınıf isminden üretme çoğul yapmak için sorgu
                string tableName = entity.GetTableName();
                string columns = entity.GetColumns();
                string values = entity.GetValues();
                if((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                {
                    columns = columns[3..^0];
                    values = values[4..^0];
                }
                string query = $"INSERT INTO {tableName} ({columns}) VALUES ({values})";
                Console.WriteLine(query); //INSERT INTO Classes (Id,Name,SectionId,TeacherId,Size,Number) VALUES (@Id,@Name,@SectionId,@TeacherId,@Size,@Number)
                context.Open();
                //context.Execute("SET IDENTITY_INSERT Lessons ON");
                context.Execute(query, entity);
                //context.Execute("SET IDENTITY_INSERT Lessons OFF");
                context.Close();
            }
        }

        public async Task AddAsync(TEntity entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                string tableName = entity.GetTableName();
                string columns = entity.GetColumns();
                string values = entity.GetValues();
                if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                {
                    columns = columns[3..^0];
                    values = values[4..^0];
                }
                string query = $"INSERT INTO {tableName} ({columns}) VALUES ({values})";
                Console.WriteLine(query); 
                await context.OpenAsync(); // burada her şeye await koymak saçma geliyor ama sistem böyle
                await context.ExecuteAsync(query, entity);
                await context.CloseAsync();
            }
        }

        public void AddMultiple(List<TEntity> entity)
        {
            if(entity.Count != 0)
            {
                using (SqlConnection context = new SqlConnection(connectionString))
                {
                    context.Open();
                    foreach (TEntity item in entity)
                    {
                        string tableName = item.GetTableName();
                        string columns = item.GetColumns();
                        string values = item.GetValues();
                        if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                        {
                            columns = columns[3..^0];
                            values = values[4..^0];
                        }
                        string query = $"INSERT INTO {tableName} ({columns}) VALUES ({values})";
                        Console.WriteLine(query);
                        context.Execute(query, entity);
                    }
                    context.Close();
                }
            }
            
        }

        public async Task AddMultipleAsync(List<TEntity> entity)
        {
            if (entity.Count != 0)
            {
                using (SqlConnection context = new SqlConnection(connectionString))
                {
                    await context.OpenAsync();
                    foreach (TEntity item in entity)
                    {
                        string tableName = item.GetTableName();
                        string columns = item.GetColumns();
                        string values = item.GetValues();
                        if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                        {
                            columns = columns[3..^0];
                            values = values[4..^0];
                        }
                        string query = $"INSERT INTO {tableName} ({columns}) VALUES ({values})";
                        Console.WriteLine(query);
                        await context.ExecuteAsync(query, entity);
                    }
                    await context.CloseAsync();
                }
            }
        }

        public void Delete(TEntity entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                /*
                 * Normalde hepsinde Id var çok kasmadan Id ile silme yapılabilirdi fakat her ihtimale karşı 
                 * tüm değerleri eşleşeni sil dedim if ve for döngüsü bu sebep ile var
                 */
                string tableName = entity.GetTableName();
                string columns = entity.GetColumns();
                string values = entity.GetValues();
                string query = $"DELETE FROM {tableName} WHERE ";
                if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                {//eğer id varsa id ile silecek yoksa tüm değerleri ile silecek
                    query += $"{columns[0..2]} = {values[0..3]}";
                    Console.WriteLine(query);
                }
                else
                {
                    List<string> columnsList = columns.Split(",").ToList();
                    List<string> valuesList = values.Split(",").ToList();
                    //Console.WriteLine($"Columns = {columnsList.Count} Values = {valuesList.Count}");
                    if (columnsList.Count != valuesList.Count)
                    {
                        throw new Exception($"Dapper Silme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                    }
                    for (int i = 0; i < columnsList.Count; i++)
                    {
                        query += $"{columnsList[i]} = {valuesList[i]}";
                        if (i != columnsList.Count - 1) { query += " AND "; }
                    }
                }
                context.Open();
                context.Execute(query, entity);
                context.Close();
            }
        }

        public async Task DeleteAsync(TEntity entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                string tableName = entity.GetTableName();
                string columns = entity.GetColumns();
                string values = entity.GetValues();
                string query = $"DELETE FROM {tableName} WHERE ";
                if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                {
                    query += $"{columns[0..2]} = {values[0..3]}";
                    Console.WriteLine(query);
                }
                else
                {
                    List<string> columnsList = columns.Split(",").ToList();
                    List<string> valuesList = values.Split(",").ToList();
                    //Console.WriteLine($"Columns = {columnsList.Count} Values = {valuesList.Count}");
                    if (columnsList.Count != valuesList.Count)
                    {
                        throw new Exception($"Dapper Silme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                    }
                    for (int i = 0; i < columnsList.Count; i++)
                    {
                        query += $"{columnsList[i]} = {valuesList[i]}";
                        if (i != columnsList.Count - 1) { query += " AND "; }
                    }
                }
                await context.OpenAsync();
                await context.ExecuteAsync(query, entity);
                await context.OpenAsync();
            }
        }

        public void DeleteMultiple(List<TEntity> entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                context.Open();
                foreach (TEntity item in entity)
                {
                    string tableName = item.GetTableName();
                    string columns = item.GetColumns();
                    string values = item.GetValues();
                    string query = $"DELETE FROM {tableName} WHERE ";
                    if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                    {
                        query += $"{columns[0..2]} = {values[0..3]}";
                        Console.WriteLine(query);
                    }
                    else
                    {
                        List<string> columnsList = columns.Split(",").ToList();
                        List<string> valuesList = values.Split(",").ToList();
                        if (columnsList.Count != valuesList.Count)
                        {
                            throw new Exception($"Dapper Silme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                        }
                        for (int i = 0; i < columnsList.Count; i++)
                        {
                            query += $"{columnsList[i]} = {valuesList[i]}";
                            if (i != columnsList.Count - 1) { query += " AND "; }
                        }
                    }
                    context.Execute(query, entity);
                }
                context.Close();
            }
        }

        public async Task DeleteMultipleAsync(List<TEntity> entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                await context.OpenAsync();
                foreach (TEntity item in entity)
                {
                    string tableName = item.GetTableName();
                    string columns = item.GetColumns();
                    string values = item.GetValues();
                    string query = $"DELETE FROM {tableName} WHERE ";
                    if ((columns.StartsWith("Id") || columns.StartsWith("ID")) && (values.StartsWith("@Id") || values.StartsWith("@ID")))
                    {
                        query += $"{columns[0..2]} = {values[0..3]}";
                        Console.WriteLine(query);
                    }
                    else
                    {
                        List<string> columnsList = columns.Split(",").ToList();
                        List<string> valuesList = values.Split(",").ToList();
                        if (columnsList.Count != valuesList.Count)
                        {
                            throw new Exception($"Dapper Silme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                        }
                        for (int i = 0; i < columnsList.Count; i++)
                        {
                            query += $"{columnsList[i]} = {valuesList[i]}";
                            if (i != columnsList.Count - 1) { query += " AND "; }
                        }
                    }
                    await context.ExecuteAsync(query, entity);
                }
                await context.CloseAsync();
            }
        }

        public TEntity Get(Expression<Func<TEntity, bool>> filter)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            { // inat sonucu yaklaşık 3 saatte fonksiyon tamamlandı 
                var binaryExp = (BinaryExpression)filter.Body;
                var left = ((MemberExpression)binaryExp.Left).Member.Name;
                object right;
                if (binaryExp.Right is ConstantExpression)
                {
                    right = ((ConstantExpression)binaryExp.Right).Value;
                }
                else if (binaryExp.Right is MemberExpression)
                {
                    var fieldInfo = ((MemberExpression)binaryExp.Right).Member as FieldInfo;
                    if (fieldInfo != null)
                    {
                        right = fieldInfo.GetValue(((ConstantExpression)((MemberExpression)binaryExp.Right).Expression).Value);
                    }
                    else
                    {
                        throw new NotSupportedException("Sağ değer çekilemedi");
                    }
                }
                else
                {
                    throw new NotSupportedException("Sağ değer çekilemedi");
                }
                var sql = $"SELECT * FROM {new TEntity().GetTableName()} WHERE {left} = {right}";
                Console.WriteLine(sql);
                context.Open();
                return context.QuerySingle<TEntity>(sql);
            }
        }

        public List<TEntity> GetAll(Expression<Func<TEntity, bool>> filter = null)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            { 
                if(filter != null)
                {
                    var binaryExp = (BinaryExpression)filter.Body;
                    var left = ((MemberExpression)binaryExp.Left).Member.Name;
                    object right;
                    if (binaryExp.Right is ConstantExpression)
                    {
                        right = ((ConstantExpression)binaryExp.Right).Value;
                    }
                    else if (binaryExp.Right is MemberExpression)
                    {
                        var fieldInfo = ((MemberExpression)binaryExp.Right).Member as FieldInfo;
                        if (fieldInfo != null)
                        {
                            right = fieldInfo.GetValue(((ConstantExpression)((MemberExpression)binaryExp.Right).Expression).Value);
                        }
                        else
                        {
                            throw new NotSupportedException("Sağ değer çekilemedi");
                        }
                    }
                    else
                    {
                        throw new NotSupportedException("Sağ değer çekilemedi");
                    }
                    var sql = $"SELECT * FROM {new TEntity().GetTableName()} WHERE {left} = {right}";
                    Console.WriteLine(sql);
                    context.Open();
                    return context.Query<TEntity>(sql).ToList();
                }
                else
                {
                    string sql = $"SELECT * FROM {new TEntity().GetTableName()}";
                    Console.WriteLine(sql);
                    context.Open();
                    return context.Query<TEntity>(sql).ToList();
                }
                
            }
        }

        public async Task<List<TEntity>> GetAllAsync(Expression<Func<TEntity, bool>> filter = null)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                if (filter != null)
                {
                    var binaryExp = (BinaryExpression)filter.Body;
                    var left = ((MemberExpression)binaryExp.Left).Member.Name;
                    object right;
                    if (binaryExp.Right is ConstantExpression)
                    {
                        right = ((ConstantExpression)binaryExp.Right).Value;
                    }
                    else if (binaryExp.Right is MemberExpression)
                    {
                        var fieldInfo = ((MemberExpression)binaryExp.Right).Member as FieldInfo;
                        if (fieldInfo != null)
                        {
                            right = fieldInfo.GetValue(((ConstantExpression)((MemberExpression)binaryExp.Right).Expression).Value);
                        }
                        else
                        {
                            throw new NotSupportedException("Sağ değer çekilemedi");
                        }
                    }
                    else
                    {
                        throw new NotSupportedException("Sağ değer çekilemedi");
                    }
                    var sql = $"SELECT * FROM {new TEntity().GetTableName()} WHERE {left} = {right}";
                    Console.WriteLine(sql);
                    await context.OpenAsync();
                    return (await context.QueryAsync<TEntity>(sql)).ToList();
                }
                else
                {
                    string sql = $"SELECT * FROM {new TEntity().GetTableName()}";
                    Console.WriteLine(sql);
                    await context.OpenAsync();
                    return (await context.QueryAsync<TEntity>(sql)).ToList();
                }

            }
        }

        public async Task<TEntity> GetAsync(Expression<Func<TEntity, bool>> filter)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            { // inat sonucu yaklaşık 3 saatte fonksiyon tamamlandı 
                var binaryExp = (BinaryExpression)filter.Body;
                var left = ((MemberExpression)binaryExp.Left).Member.Name;
                object right;
                if (binaryExp.Right is ConstantExpression)
                {
                    right = ((ConstantExpression)binaryExp.Right).Value;
                }
                else if (binaryExp.Right is MemberExpression)
                {
                    var fieldInfo = ((MemberExpression)binaryExp.Right).Member as FieldInfo;
                    if (fieldInfo != null)
                    {
                        right = fieldInfo.GetValue(((ConstantExpression)((MemberExpression)binaryExp.Right).Expression).Value);
                    }
                    else
                    {
                        throw new NotSupportedException("Sağ değer çekilemedi");
                    }
                }
                else
                {
                    throw new NotSupportedException("Sağ değer çekilemedi");
                }
                var sql = $"SELECT * FROM {new TEntity().GetTableName()} WHERE {left} = {right}";
                Console.WriteLine(sql);
                await context.OpenAsync();
                return await context.QuerySingleAsync<TEntity>(sql);
            }
        }

        public void Update(TEntity entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                string tableName = entity.GetTableName();
                string columns = entity.GetColumns();
                string values = entity.GetValues();
                List<string> columnsList = columns.Split(",").ToList();
                List<string> valuesList = values.Split(",").ToList();
                string query = $"UPDATE {tableName} SET ";

                //her tablo Id ile başlandığı varsayıldı her duruma uygun yöntem aklıma gelmedi bu sayfada harcanan vakit sonrası kafada kalmadı
                if (columnsList.Count != valuesList.Count)
                {
                    throw new Exception($"Dapper güncelleme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                }
                for (int i = 1; i < columnsList.Count; i++)
                {
                    query += $"{columnsList[i]} = {valuesList[i]}";
                    if (i != columnsList.Count - 1) { query += ", "; }
                }
                query += $" WHERE {columns[0..2]} = {values[0..3]}";

                Console.WriteLine(query); //INSERT INTO Classes (Id,Name,SectionId,TeacherId,Size,Number) VALUES (@Id,@Name,@SectionId,@TeacherId,@Size,@Number)
                context.Open();
                context.Execute(query, entity);
                context.Close();
            }
        }

        public async Task UpdateAsync(TEntity entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                string tableName = entity.GetTableName();
                string columns = entity.GetColumns();
                string values = entity.GetValues();
                List<string> columnsList = columns.Split(",").ToList();
                List<string> valuesList = values.Split(",").ToList();
                string query = $"UPDATE {tableName} SET ";
                if (columnsList.Count != valuesList.Count)
                {
                    throw new Exception($"Dapper güncelleme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                }
                for (int i = 1; i < columnsList.Count; i++)
                {
                    query += $"{columnsList[i]} = {valuesList[i]}";
                    if (i != columnsList.Count - 1) { query += ", "; }
                }
                query += $" WHERE {columns[0..2]} = {values[0..3]}";
                Console.WriteLine(query); 
                await context.OpenAsync();
                await context.ExecuteAsync(query, entity);
                await context.OpenAsync();
            }
        }

        public void UpdateMultiple(List<TEntity> entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                context.Open();
                foreach (TEntity item in entity)
                {
                    string tableName = item.GetTableName();
                    string columns = item.GetColumns();
                    string values = item.GetValues();
                    List<string> columnsList = columns.Split(",").ToList();
                    List<string> valuesList = values.Split(",").ToList();
                    string query = $"UPDATE {tableName} SET ";
                    if (columnsList.Count != valuesList.Count)
                    {
                        throw new Exception($"Dapper güncelleme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                    }
                    for (int i = 1; i < columnsList.Count; i++)
                    {
                        query += $"{columnsList[i]} = {valuesList[i]}";
                        if (i != columnsList.Count - 1) { query += ", "; }
                    }
                    query += $" WHERE {columns[0..2]} = {values[0..3]}";

                    Console.WriteLine(query); 
                    context.Execute(query, entity);
                }
                context.Close();
            }
        }

        public async Task UpdateMultipleAsync(List<TEntity> entity)
        {
            using (SqlConnection context = new SqlConnection(connectionString))
            {
                await context.OpenAsync();
                foreach (TEntity item in entity)
                {
                    string tableName = item.GetTableName();
                    string columns = item.GetColumns();
                    string values = item.GetValues();
                    List<string> columnsList = columns.Split(",").ToList();
                    List<string> valuesList = values.Split(",").ToList();
                    string query = $"UPDATE {tableName} SET ";
                    if (columnsList.Count != valuesList.Count)
                    {
                        throw new Exception($"Dapper güncelleme Base de hata var iki liste eşit değil Columns = {columnsList.Count} Values = {valuesList.Count}");
                    }
                    for (int i = 1; i < columnsList.Count; i++)
                    {
                        query += $"{columnsList[i]} = {valuesList[i]}";
                        if (i != columnsList.Count - 1) { query += ", "; }
                    }
                    query += $" WHERE {columns[0..2]} = {values[0..3]}";

                    Console.WriteLine(query);
                    await context.ExecuteAsync(query, entity);
                }
                await context.CloseAsync();
            }
        }
    }
}
