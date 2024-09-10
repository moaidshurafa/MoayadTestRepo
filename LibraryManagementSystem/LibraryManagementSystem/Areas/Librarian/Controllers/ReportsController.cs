using LibraryManagementSystem.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LibraryManagementSystem.Areas.Librarian.Controllers
{
    [Area("Librarian")]
    public class ReportsController : Controller
    {
        private readonly LibraryDbContext _db;
        public ReportsController(LibraryDbContext db)
        {
            _db = db;
        }
        public IActionResult BookLoans()
        {
            var loans = _db.Loans.Include(l => l.Book).Include(l => l.Member).ToList();
            return View(loans);
        }
        public IActionResult OverdueBooks()
        {
            var overduebooks = _db.Loans
                .Include(l => l.Book)
                .Include(l => l.Member)
                .Where(l => l.DueDate < DateTime.Now && l.ReturnDate == null)
                .ToList();
            return View(overduebooks);
        }
        public IActionResult MemberActivity()
        {
            var memberActivity = _db.Members
                .Include(m => m.Loans)
                .ToList();
            return View(memberActivity);
        }
    }
}
