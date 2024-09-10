using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace LibraryManagementSystem.Models
{
    public class Book
    {

        [Key]
        public int BookId { get; set; }

        [Required(ErrorMessage = "Title is required")]
        [MaxLength(30, ErrorMessage = "Title cannot exceed 30 characters")]
        public string? Title { get; set; }

        [Required(ErrorMessage = "Author is required")]
        [MaxLength(30)]
        public string? Author { get; set; }

        [Required(ErrorMessage = "ISBN is required")]
        [StringLength(20)]
        [RegularExpression(@"^\d{3}-\d{1,5}-\d{1,7}-\d{1,7}-\d{1}$", ErrorMessage = "Invalid ISBN format. Use format xxx-x-xxxx-xxxx-x.")]


        public string? ISBN { get; set; }

        public int CategoryId { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "Copies Available must be a positive number")]
        public int CopiesAvailable { get; set; }

        [ForeignKey("CategoryId")]
        public virtual Category? Category { get; set; }
    }
}
