using LibraryManagementSystem.Data;
using LibraryManagementSystem.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagementSystem.Areas.Librarian.Controllers
{
    [Area("Librarian")]
    public class LoanController : Controller
    {
        private readonly LibraryDbContext _db;
        public LoanController(LibraryDbContext db)
        {
            _db = db;
        }
        public IActionResult Index()
        {
            var loans = _db.Loans.Include(l => l.Book).Include(l => l.Member).ToList();
            return View(loans);
        }
        public IActionResult Create()
        {
            ViewBag.Books = _db.Books.Where(b => b.CopiesAvailable > 0).ToList();
            ViewBag.Members = _db.Members.ToList();
            return View();
        }
        [HttpPost]
        public IActionResult Create(Loan obj)
        {
            if (ModelState.IsValid)
            {
                obj.LoanDate = DateTime.Now;
                _db.Loans.Add(obj);

                var book = _db.Books.Find(obj.BookId);

                if (book != null)
                {
                    book.CopiesAvailable--;
                    _db.SaveChanges();
                    TempData["success"] = "Book loaned  successfully";
                    return RedirectToAction("Index");
                }

            }


            ViewBag.Books = _db.Books.Where(b => b.CopiesAvailable > 0).ToList();
            ViewBag.Members = _db.Members.ToList();
            return View(obj);
        }
        public IActionResult Return(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }

            var loan = _db.Loans.Include(l => l.Book).Include(l => l.Member).FirstOrDefault(l => l.LoanId == id);

            if (loan == null)
            {
                return NotFound();
            }
            ViewBag.Books = _db.Books.Where(b => b.CopiesAvailable > 0).ToList();
            ViewBag.Members = _db.Members.ToList();
            return View(loan);
        }

        [HttpPost, ActionName("Return")]
        public IActionResult ReturnPOST(int? id)
        {
            var loan = _db.Loans.Find(id);

            if (loan == null)
            {
                return NotFound();
            }

            loan.ReturnDate = DateTime.Now;

            var book = _db.Books.Find(loan.BookId);
            if (book != null)
            {
                book.CopiesAvailable++;
            }

            _db.SaveChanges();
            TempData["success"] = "Book returned successfully";
            ViewBag.Books = _db.Books.Where(b => b.CopiesAvailable > 0).ToList();
            ViewBag.Members = _db.Members.ToList();
            return RedirectToAction("Index");
        }



    }
}
