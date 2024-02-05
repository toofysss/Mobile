using LawApi.Database;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.StaticFiles;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace LawApi.Controllers
{

    [ApiController]
    [Route("[controller]")]
    //////// "كتب ومؤلفات قانونية"
    public class BooksLegalWritingsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        public BooksLegalWritingsController(ApplicationDbContext logger) => _context = logger;

        [HttpGet("GetAll")]
        public ActionResult<IEnumerable<BooksLegalWritings>> Get()
        {
            return Ok(_context.BooksLegalWritings.OrderByDescending(x => x.ID));
        }

        [HttpPost("Insert")]
        public async Task<IActionResult> Insert(IFormFile file, [FromForm] BooksLegalWritings Consultation)
        {
            var result = await Insertfile(file);
            Consultation.Files = result;
            Consultation.ID = 0;
            _context.BooksLegalWritings.Add(Consultation);
            _context.SaveChanges();
            return Ok("success");
        }

        [HttpGet("{filename}")]
        public ActionResult GetFile(string filename)
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\BookLegal");
            var filepath = Path.Combine(path, filename);

            if (System.IO.File.Exists(filepath))
            {
                byte[] fileBytes = System.IO.File.ReadAllBytes(filepath);
                string contentType = GetContentType(filepath);
                return File(fileBytes, contentType, filename);
            }

            return NotFound();
        }

        private static string GetContentType(string filepath)
        {
            var provider = new FileExtensionContentTypeProvider();
            if (!provider.TryGetContentType(filepath, out string contentType))
            {
                contentType = "application/octet-stream";
            }
            return contentType;
        }

        private static async Task<string> Insertfile(IFormFile File)
        {
            var extension = "." + File.FileName.Split('.')[^1];
            string Filename = DateTime.Now.Ticks.ToString() + extension;

            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\BookLegal");

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }

            var exactpath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\BookLegal", Filename);
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

            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\BookLegal");

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
        public async Task<IActionResult> UploadFiles(IFormFile file, [FromForm] BooksLegalWritings Consultation)
        {
            var data = _context.BooksLegalWritings.FirstOrDefault(x => x.ID == Consultation.ID);
            if (data == null) return NotFound();
            var result = await UpdateFile(file, data.Files);
            data.Files = result;
            if (Consultation.Files != null) data.Files = Consultation.Files;
            if (Consultation.Dscrp != null) data.Dscrp = Consultation.Dscrp;
            _context.BooksLegalWritings.Update(data);
            _context.SaveChanges();
            return Ok("success");
        }
        
        private static string RemoveFile(string oldImage)
        {

            var extension = "." + oldImage.Split('.')[^1];
            string filename = DateTime.Now.Ticks.ToString() + extension;

            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\BookLegal");


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
            var data = _context.BooksLegalWritings.FirstOrDefault(x => x.ID == id);
            if (data == null) return NotFound();
            _ = RemoveFile(data.Files);
            _context.BooksLegalWritings.Remove(data);
            _context.SaveChanges();
            return Ok("success");
        }

    }

}
