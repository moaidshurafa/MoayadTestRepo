using LibraryManagementSystem.Data;
using LibraryManagementSystem.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagementSystem.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class BookController : Controller
    {
        private readonly LibraryDbContext _db;
        public BookController(LibraryDbContext db)
        {
            _db = db;
        }
        public IActionResult Index()
        {
            var books = _db.Books.Include(b => b.Category).ToList();
            return View(books);
        }
        public IActionResult Create()
        {
            ViewBag.Categories = _db.Categories.ToList();
            return View();
        }
        [HttpPost]
        public IActionResult Create(Book obj)
        {
            if (ModelState.IsValid)
            {
                _db.Books.Add(obj);
                _db.SaveChanges();
                TempData["success"] = "Book created successfully";
                return RedirectToAction("Index");
            }
            ViewBag.Categories = _db.Categories.ToList();
            return View(obj);

        }
        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }

            Book? bookFromDb = _db.Books.Find(id);


            if (bookFromDb == null)
            {
                return NotFound();
            }
            ViewBag.Categories = _db.Categories.ToList();
            return View(bookFromDb);

        }
        [HttpPost]
        public IActionResult Edit(Book obj)
        {
            if (ModelState.IsValid)
            {
                _db.Books.Update(obj);
                _db.SaveChanges();
                TempData["success"] = "Book updated successfully";
                return RedirectToAction("Index");
            }
            ViewBag.Categories = _db.Categories.ToList();
            return View();
        }
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }

            Book? bookFromDb = _db.Books.Find(id);

            if (bookFromDb == null)
            {
                return NotFound();
            }
            ViewBag.Categories = _db.Categories.ToList();
            return View(bookFromDb);

        }
        [HttpPost, ActionName("Delete")]
        public IActionResult DeletePOST(int? id)
        {
            Book? obj = _db.Books.Find(id);
            if (obj == null)
            {
                return NotFound();
            }
            _db.Books.Remove(obj);
            _db.SaveChanges();
            TempData["success"] = "Book deleted successfully";
            ViewBag.Categories = _db.Categories.ToList();
            return RedirectToAction("Index");
        }
    }
}
