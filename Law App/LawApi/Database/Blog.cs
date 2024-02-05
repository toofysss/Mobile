using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace LawApi.Database
{
    [Table("blogtype")]
    public class BlogType
    {
        public int ID { get; set; }
        public string Type { get; set; }
        [JsonIgnore]
        public List<Blog> Blog { get; set; }
    }
    [Table("blog")]
    public class Blog
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Dscrp { get; set; }
        public string Img { get; set; }
        public string Date { get; set; }
        public int BlogTypeID { get; set; }
        public int Status { get; set; }
    }
}
