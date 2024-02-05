using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LawApi.Database
{
    [Table("city")]
    public class City
    {
        public int ID { get; set; }
        public string Dscrp { get; set; }
        public string DscrpE { get; set; }
        public List<Laweys> laweys { get; set; }
    }
}
