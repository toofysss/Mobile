using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace LawApi.Database
{
    [Table("Discriminatoryregulations")]
    public class Discriminatoryregulations
    {
        public int ID { get; set; }
        public string Dscrp { get; set; }
        [JsonIgnore]
        public List<DiscriminatoryregulationsDetails> DiscriminatoryregulationsDetails { get; set; }
    }
    [Table("DiscriminatoryregulationsDetails")]
    public class DiscriminatoryregulationsDetails
    {
        public int ID { get; set; }
        public int DiscriminatoryregulationsID { get; set; }
        public string Title { get; set; }
        public string Details { get; set; }
    }
}
