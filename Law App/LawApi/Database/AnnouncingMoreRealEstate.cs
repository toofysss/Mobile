using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LawApi.Database
{
    [Table("AnnouncingMoreRealEstate")]
    public class AnnouncingMoreRealEstate
    {
        public int ID { get; set; }
        public string Lawname { get; set; }
        public string Type { get; set; }
        public string Owners { get; set; }
        public string Address { get; set; }
        public string Space { get; set; }
        public string Price { get; set; }
        public string Date { get; set; }
        public string Dscrp { get; set; }
        public string Img { get; set; }
        public int Status { get; set; }         
    }
}
