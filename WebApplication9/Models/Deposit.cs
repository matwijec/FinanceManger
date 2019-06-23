using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApplication9.Models
{
    public class Deposit
    {
        public int IdD { get; set; }
        public int Amount { get; set; }
        public int LendingRate { get; set; }
        public DateTime DateOfStart { get; set; }
        public DateTime DateOfEnd { get; set; }
        public int IdA { get; set; }
    }
}
