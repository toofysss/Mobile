using LawApi.Database;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace LawApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    //////// الاخبار

    public class BlogControll:ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public BlogControll(ApplicationDbContext logger) => _context = logger;

        [HttpGet("GetAll")]
        public ActionResult<IEnumerable<Blog>> GetNotes()
        {
            var sectionsWithDataNotes = _context.BlogType.Include(x => x.Blog).ToList();
            var transformedData = sectionsWithDataNotes.Select(w => new
            {
                w.ID,
                w.Type,
                Details = w.Blog.Where(x=>x.Status==1).OrderByDescending(x=>x.ID).Select(c => new
                {
                   c.ID,
                   c.Title,
                   c.Dscrp,
                   c.Img,
                   c.Date,
                   c.Status
                }).ToList()
            });

            return Ok(transformedData);
        }
        [HttpGet("Get")]
        public ActionResult<IEnumerable<Blog>> GetBlogs()
        {
            return Ok(_context.Blog);
        }

        [HttpPost("InsertBlog")]
        public async Task<ActionResult<IEnumerable<Blog>>> Insert(IFormFile img,  [FromForm] Blog Blog)
        {
            var Img = await Insertfiles(img);

            Blog.Img = Img;
            Blog.ID = 0;
            _context.Blog.Add(Blog);
            _context.SaveChanges();
            return Ok("success");
        }
        private static async Task<string> Insertfiles(IFormFile File)
        {
            var extension = "." + File.FileName.Split('.')[^1];
            string Filename = DateTime.Now.Ticks.ToString() + extension;

            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\Blog");

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }

            var exactpath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\Blog", Filename);
            using (var stream = new FileStream(exactpath, FileMode.Create))
            {
                await File.CopyToAsync(stream);
            }


            return Filename;
        }

        [HttpGet("{filename}")]
        public ActionResult GetImage(string filename)
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\Blog");
            var filepath = Path.Combine(path, filename);

            if (System.IO.File.Exists(filepath))
            {
                byte[] b = System.IO.File.ReadAllBytes(filepath);
                return File(b, "image/png");
            }

            return NotFound();
        }

        [HttpDelete("Delete")]
        public ActionResult<IEnumerable<Blog>> Delete(int id)
        {
            var blog = _context.Blog.FirstOrDefault(x => x.ID == id);
            if (blog == null) return NotFound();
            RemoveFile(blog.Img);
            _context.Blog.Remove(blog);
            _context.SaveChanges();
            return Ok("success");
        }
        private static string RemoveFile(string oldImage)
        {

            var extension = "." + oldImage.Split('.')[^1];
            string filename = DateTime.Now.Ticks.ToString() + extension;

            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "Upload\\Blog");


            // Delete the old file if it exists
            if (System.IO.File.Exists(Path.Combine(filePath, oldImage)))
            {
                System.IO.File.Delete(Path.Combine(filePath, oldImage));
            }

            return filename;

        }

        [HttpPut("Update")]
        public ActionResult<IEnumerable<Blog>> Update([FromBody] Blog blog)
        {
            var blogdata = _context.Blog.FirstOrDefault(x => x.ID == blog.ID);
            if (blogdata == null) return NotFound();
            if(blog.Title !=null)blogdata.Title = blog.Title;
            if (blog.Img != null)blogdata.Img = blog.Img;
            if (blog.Dscrp != null) blogdata.Dscrp = blog.Dscrp;
            if (blog.Status >0) blogdata.Status = blog.Status;
            _context.Blog.Update(blogdata);
            _context.SaveChanges();
            return Ok("success");
        }
    }
}
