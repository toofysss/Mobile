using LawApi.Database;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace LawApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    //////// "اعلان المزيدات العقارية"
    public class AnnouncingMoreRealEstateController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public AnnouncingMoreRealEstateController(ApplicationDbContext logger) => _context = logger;

        [HttpGet("GetAll")]
        public ActionResult<IEnumerable<AnnouncingMoreRealEstate>> GetAll()
        {
            return Ok(_context.AnnouncingMoreRealEstate.OrderByDescending(x => x.ID).Where(x=>x.Status==1));
        }
        [HttpGet("Get")]
        public ActionResult<IEnumerable<AnnouncingMoreRealEstate>> Get()
        {
            return Ok(_context.AnnouncingMoreRealEstate.OrderByDescending(x => x.ID));
        }
        [HttpPost("Insert")]
        public async Task<IActionResult> Insert(IFormFile file, [FromForm] AnnouncingMoreRealEstate Consultation)
        {
            var result = await Insertfile(file);
            Consultation.Img = result;
            Consultation.ID = 0;
            _context.AnnouncingMoreRealEstate.Add(Consultation);
            _context.SaveChanges();
            return Ok("success");
        }

        [HttpGet("{filename}")]
        public ActionResult GetFile(string filename)
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\AnnouncingMoreRealEstate");
            var filepath = Path.Combine(path, filename);

            if (System.IO.File.Exists(filepath))
            {
                byte[] b = System.IO.File.ReadAllBytes(filepath);
                return File(b, "image/png");
            }

            return NotFound();
        }

        private static async Task<string> Insertfile(IFormFile File)
        {
            var extension = "." + File.FileName.Split('.')[^1];
            string Filename = DateTime.Now.Ticks.ToString() + extension;

            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\AnnouncingMoreRealEstate");

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }

            var exactpath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\AnnouncingMoreRealEstate", Filename);
            using (var stream = new FileStream(exactpath, FileMode.Create))
            {
                await File.CopyToAsync(stream);
            }


            return Filename;
        }

        private static async Task<string> UpdateFile(IFormFile file, string oldimage)
        {
            var extension = "." + file.FileName.Split('.')[^1];
            string filename = DateTime.Now.Ticks.ToString() + extension;

            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\AnnouncingMoreRealEstate");

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }

            var exactpath = Path.Combine(filepath, filename);

            // Check if the file with the specified filename exists
            string fileToDelete = oldimage;
            var filePathToDelete = Path.Combine(filepath, fileToDelete);

            if (System.IO.File.Exists(filePathToDelete))
            {
                // Delete the file if it exists
                System.IO.File.Delete(filePathToDelete);
            }

            using (var stream = new FileStream(exactpath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return filename;
        }

        [HttpPut("Update")]
        public async Task<IActionResult> UploadFiles(IFormFile file, [FromForm] AnnouncingMoreRealEstate Consultation)
        {
            var data = _context.AnnouncingMoreRealEstate.FirstOrDefault(x => x.ID == Consultation.ID);
            if (data == null) return NotFound();
            var result = await UpdateFile(file, data.Img);
            data.Img = result;

            if (Consultation.Lawname != null) data.Lawname = Consultation.Lawname;
            if (Consultation.Type != null) data.Type = Consultation.Type;
            if (Consultation.Owners != null) data.Owners = Consultation.Owners;
            if (Consultation.Address != null) data.Address = Consultation.Address;
            if (Consultation.Price != null) data.Price = Consultation.Price;
            if (Consultation.Date != null) data.Date = Consultation.Date;
            if (Consultation.Date != null) data.Date = Consultation.Date;
            if (Consultation.Img != null) data.Img = Consultation.Img;
            if (Consultation.Dscrp != null) data.Dscrp = Consultation.Dscrp;          
            if (Consultation.Space != null) data.Space = Consultation.Space;
            if (Consultation.Status >0) data.Status = Consultation.Status;
            _context.AnnouncingMoreRealEstate.Update(data);
            _context.SaveChanges();
            return Ok("success");
        }
        [HttpPut("UpdateData")]
        public ActionResult<IEnumerable<AnnouncingMoreRealEstate>> Update([FromBody] AnnouncingMoreRealEstate blog)
        {
            var blogdata = _context.AnnouncingMoreRealEstate.FirstOrDefault(x => x.ID == blog.ID);
            if (blogdata == null) return NotFound();
            if (blog.Status > 0) blogdata.Status = blog.Status;
            _context.AnnouncingMoreRealEstate.Update(blogdata);
            _context.SaveChanges();
            return Ok("success");
        }
        private static string RemoveFile(string oldImage)
        {

            var extension = "." + oldImage.Split('.')[^1];
            string filename = DateTime.Now.Ticks.ToString() + extension;

            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\AnnouncingMoreRealEstate");


            // Delete the old file if it exists
            if (System.IO.File.Exists(Path.Combine(filePath, oldImage)))
            {
                System.IO.File.Delete(Path.Combine(filePath, oldImage));
            }

            return filename;

        }

        [HttpDelete("DeleteAll")]
        public ActionResult DeleteAll(int id)
        {
            var data = _context.AnnouncingMoreRealEstate.FirstOrDefault(x => x.ID == id);
            if (data == null) return NotFound();
            _ = RemoveFile(data.Img);
            _context.AnnouncingMoreRealEstate.Remove(data);
            _context.SaveChanges();
            return Ok("success");
        }
    }
    }
