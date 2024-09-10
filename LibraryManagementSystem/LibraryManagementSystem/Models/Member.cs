using System.ComponentModel.DataAnnotations;

namespace LibraryManagementSystem.Models
{
    public class Member
    {
        [Key]
        public int MemberId { get; set; }

        [Required]
        [StringLength(30)]
        public string? FullName { get; set; }

        [Required]
        [EmailAddress(ErrorMessage = "Invalid email format.")]
        [StringLength(30)]
        public string? Email { get; set; }

        [Required]
        public DateTime MembershipDate { get; set; }

        public List<Loan>? Loans { get; set; }
    }
}
