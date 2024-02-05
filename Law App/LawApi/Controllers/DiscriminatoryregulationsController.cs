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
    ////////  لوائح تميزية

    public class DiscriminatoryregulationsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public DiscriminatoryregulationsController(ApplicationDbContext logger) => _context = logger;

        [HttpGet("GetAll")]
        public ActionResult<IEnumerable<Discriminatoryregulations>> GetNotes()
        {
            var sectionsWithDataNotes = _context.Discriminatoryregulations.Include(x => x.DiscriminatoryregulationsDetails).ToList();
            var transformedData = sectionsWithDataNotes.Select(w => new
            {
                w.ID,
                w.Dscrp,
                Details = w.DiscriminatoryregulationsDetails.Select(c => new
                {
                    c.ID,
                    c.Title,
                    c.Details,
                    c.DiscriminatoryregulationsID,
                }).ToList()
            });

            return Ok(transformedData);
        }

        [HttpDelete("DeleteHeader")]
        public ActionResult<IEnumerable<Discriminatoryregulations>> DeleteHeader(int id)
        {
            var Booksdata = _context.Discriminatoryregulations.FirstOrDefault(x => x.ID == id);
            if (Booksdata == null) return NotFound();
            _context.Discriminatoryregulations.Remove(Booksdata);
            _context.SaveChanges();
            return Ok("success");
        }
        [HttpDelete("Delete")]
        public ActionResult<IEnumerable<DiscriminatoryregulationsDetails>> Delete(int id)
        {
            var Booksdata = _context.DiscriminatoryregulationsDetails.FirstOrDefault(x => x.ID == id);
            if (Booksdata == null) return NotFound();
            _context.DiscriminatoryregulationsDetails.Remove(Booksdata);
            _context.SaveChanges();
            return Ok("success");
        }

        [HttpPost("InsertHeader")]
        public ActionResult<IEnumerable<Discriminatoryregulations>> InsertHeader([FromBody] Discriminatoryregulations Books)
        {
            _context.Discriminatoryregulations.Add(Books);
            _context.SaveChanges();
            return Ok("success");
        }
        [HttpPost("Insert")]
        public ActionResult<IEnumerable<DiscriminatoryregulationsDetails>> Insert([FromBody] DiscriminatoryregulationsDetails Books)
        {
            _context.DiscriminatoryregulationsDetails.Add(Books);
            _context.SaveChanges();
            return Ok("success");
        }
        [HttpPut("UpdateHeader")]
        public ActionResult<IEnumerable<Discriminatoryregulations>> UpdateHeader([FromBody] Discriminatoryregulations Books)
        {
            var Booksdata = _context.Discriminatoryregulations.FirstOrDefault(x => x.ID == Books.ID);
            if (Booksdata == null) return NotFound();
            if (Books.Dscrp != null) Booksdata.Dscrp = Books.Dscrp;
            _context.Discriminatoryregulations.Update(Booksdata);
            _context.SaveChanges();
            return Ok("success");
        }
        [HttpPut("Update")]
        public ActionResult<IEnumerable<DiscriminatoryregulationsDetails>> Update([FromBody] DiscriminatoryregulationsDetails Books)
        {
            var Booksdata = _context.DiscriminatoryregulationsDetails.FirstOrDefault(x => x.ID == Books.ID);
            if (Booksdata == null) return NotFound();
            if (Books.Title != null) Booksdata.Title = Books.Title;
            if (Books.Details != null) Booksdata.Details = Books.Details;
            if (Books.DiscriminatoryregulationsID >0) Booksdata.DiscriminatoryregulationsID = Books.DiscriminatoryregulationsID;
            _context.DiscriminatoryregulationsDetails.Update(Booksdata);
            _context.SaveChanges();
            return Ok("success");
        }

    }

}
