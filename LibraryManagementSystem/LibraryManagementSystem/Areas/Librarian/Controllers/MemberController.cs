using LibraryManagementSystem.Data;
using LibraryManagementSystem.Models;
using Microsoft.AspNetCore.Mvc;

namespace LibraryManagementSystem.Areas.Librarian.Controllers
{
    [Area("Librarian")]
    public class MemberController : Controller
    {
        private readonly LibraryDbContext _db;
        public MemberController(LibraryDbContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            var members = _db.Members.ToList();
            return View(members);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Member obj)
        {
            if (ModelState.IsValid)
            {
                _db.Add(obj);
                _db.SaveChanges();
                TempData["success"] = "Member created successfully";
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            Member? memberFromDb = _db.Members.Find(id);

            if (memberFromDb == null)
            {
                return NotFound();
            }
            return View(memberFromDb);

        }
        [HttpPost]
        public IActionResult Edit(Member obj)
        {
            if (ModelState.IsValid)
            {
                _db.Members.Update(obj);
                _db.SaveChanges();
                TempData["success"] = "Member updated successfully";
                return RedirectToAction("Index");
            }
            return View();
        }
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            Member? memberFromDb = _db.Members.Find(id);

            if (memberFromDb == null)
            {
                return NotFound();
            }
            return View(memberFromDb);
        }
        [HttpPost, ActionName("Delete")]
        public IActionResult DeletePOST(int? id)
        {
            Member? obj = _db.Members.Find(id);
            if (obj == null)
            {
                return NotFound();
            }
            _db.Members.Remove(obj);
            _db.SaveChanges();
            TempData["success"] = "Member deleted successfully";
            return RedirectToAction("Index");
        }
    }
}
