using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication9.Models
{
    public class Account
    { 
        public int IdA { get; set; }
        public int IdRevenue { get; set; }
        public int IdExpense { get; set; }
        public int IdDeposit { get; set; }
        public int IdCredit { get; set; }
        [Required]
        public string NumberOfAccount { get; set; }
        [Required]
        public int Balance { get; set; }
        public int IdU { get; set; }
        public string Bank { get; set; }
    }
}
