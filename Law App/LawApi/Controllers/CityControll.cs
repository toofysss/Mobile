using LawApi.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LawApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CityControll:ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CityControll(ApplicationDbContext logger) => _context = logger;
        [HttpGet("GetAll")]
        public ActionResult<IEnumerable<City>> Get()
        {
            var sectionsWithDataNotes = _context.City.Include(x => x.laweys).ToList();
            var transformedData = sectionsWithDataNotes.Select(w => new
            {
                w.ID,
                w.Dscrp,
                w.DscrpE,

                Details = w.laweys.Where(x=>x.Status==1).OrderByDescending(x=>x.ID).Select(c => new
                {
                    c.ID,
                    c.City,
                    c.Depart,
                    c.Dscrp,
                    c.Img,
                    c.Name,
                    c.Phone,
                    c.Rating,
                    c.Room,
                }).ToList()
            });
            return Ok(transformedData);
        }
 
    }
}
