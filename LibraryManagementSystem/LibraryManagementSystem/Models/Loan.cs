using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;


namespace LibraryManagementSystem.Models
{
    public class Loan
    {
        [Key]
        public int LoanId { get; set; }
        [Required]
        public int BookId { get; set; }
        [Required]
        public int MemberId { get; set; }

        [Required]
        public DateTime LoanDate { get; set; }

        [Required]
        public DateTime DueDate { get; set; }

        public DateTime? ReturnDate { get; set; }

        [ForeignKey("BookId")]
        public virtual Book? Book { get; set; }

        [ForeignKey("MemberId")]
        public virtual Member? Member { get; set; }


    }
}
