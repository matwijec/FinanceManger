using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication9.Models
{
    public class Credit
    {
        public int IdC { get; set; }
        public string Name { get; set; }
        [Required]
        public int Amount { get; set; }
        public int AmountLeft { get; set; }
        public int LendingRate { get; set; }
        public int IdA { get; set; }
    }
}
