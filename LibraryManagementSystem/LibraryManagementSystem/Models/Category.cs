using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace LibraryManagementSystem.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }

        public virtual ICollection<Book>? Books { get; set; }
    }
}
