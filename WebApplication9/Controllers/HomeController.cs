using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Oracle.ManagedDataAccess.Client;
using WebApplication9.Models;


namespace WebApplication9.Controllers
{

    public class HomeController : Controller
    {

        string conString = "...";
        public IActionResult Index()
        {

            return RedirectToAction("/Login");
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }


        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Account(string number)
        {
            HttpContext.Session.SetString("numberacc", number);
            return View();
        }


        [HttpGet]
        public IActionResult DelCredit(int number)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("CREDIT_DELETE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("c_idc", number));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                }
            }
            return RedirectToAction("credit");
        }
        [HttpGet]
        public IActionResult UpDeposit(int number)
        {
            HttpContext.Session.SetInt32("IdD", number);
            return View();
        }

        [HttpPost]
        public IActionResult UpDeposit(Deposit deposit)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("DEPOSIT_Update", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("d_amount", deposit.Amount));
                    cmd.Parameters.Add(new OracleParameter("d_lendingrate", deposit.LendingRate));
                    cmd.Parameters.Add(new OracleParameter("d_start", deposit.DateOfStart));
                    cmd.Parameters.Add(new OracleParameter("d_end", deposit.DateOfEnd));
                    cmd.Parameters.Add(new OracleParameter("d_ida", HttpContext.Session.GetInt32("IdD")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Deposit");
                }
            }
        }


        [HttpGet]
        public IActionResult DelExpense(int number)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("EXPENSE_DELETE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("e_id", number));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                }
            }
            return RedirectToAction("Expense");
        }

        [HttpGet]
        public IActionResult DelDeposit(int number)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("DEPOSIT_DELETE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("d_id", number));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                }
            }
            return RedirectToAction("Deposit");
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }


        [Route("login")]
        [HttpPost]
        public IActionResult Login(User user)
        {
            
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("LOGGING", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add("Return_Value", OracleDbType.Int32, ParameterDirection.ReturnValue);
                    cmd.Parameters.Add(new OracleParameter("u_email", user.Email));
                    cmd.Parameters.Add(new OracleParameter("u_password", user.Password));
                    OracleDataReader reader = cmd.ExecuteReader();

                    if (reader == null)
                    {
                        Conn.Close();
                        ViewBag.error = "Invalid Account";
                        return View("Login");
                    }
                    else
                    {
                        Conn.Close();
                        HttpContext.Session.SetString("username", user.Email);
                        return RedirectToAction("Panel");
                    }

                }
            }

        }

        [HttpGet]
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("username");
            return RedirectToAction("/Login");
        }




        [HttpGet]
        public IActionResult Panel()
        {

            List<Account> accounts = new List<Account>();

            using (OracleConnection conn = new OracleConnection(conString))
            {
                conn.Open();
                using (var cmd = new OracleCommand("ACCOUNT_SELECT", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    OracleParameter p = new OracleParameter("cur", OracleDbType.RefCursor, ParameterDirection.Output);
                    p.Size = 200;
                    cmd.Parameters.Add(p);
                    cmd.Parameters.Add(new OracleParameter("u_email", HttpContext.Session.GetString("username")));
                    cmd.ExecuteNonQuery();

                    using (var Adapter = new OracleDataAdapter())
                    {
                        var dataSet = new DataSet();
                        var dataSet2 = new DataTable();
                        Adapter.SelectCommand = cmd;
                        Adapter.Fill(dataSet);
                        dataSet2 = dataSet.Tables[0];
                        for (int i = 0; i < dataSet2.Rows.Count; i++)
                        {
                            Account account = new Account()
                            {
                                IdA = Convert.ToInt32(dataSet2.Rows[i][0]),
                                NumberOfAccount = dataSet2.Rows[i][1].ToString(),
                                Balance = Convert.ToInt32(dataSet2.Rows[i][2]),
                                IdU = Convert.ToInt32(dataSet2.Rows[i][3]),
                                Bank = dataSet2.Rows[i][4].ToString()
                            };
                            accounts.Add(account);
                        }

                    }

                    using (var cmd2 = new OracleCommand("SUMA", conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    })
                    {
                        
                        cmd2.Parameters.Add("Return_Value", OracleDbType.Int32, ParameterDirection.ReturnValue);
                        cmd2.ExecuteNonQuery();
                        var sum1 = int.Parse(cmd2.Parameters["Return_Value"].Value.ToString());
                        ViewBag.sum = sum1;

                    }
                }

            }
            return View(accounts);
        }


        [HttpPost, ValidateAntiForgeryToken]
        public IActionResult Register(User user)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("USER_INSERT", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("u_email", user.Email));
                    cmd.Parameters.Add(new OracleParameter("u_password", user.Password));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                    return View();
                }
            }
        }


        [HttpGet]
        public IActionResult AddAccount()
        {
            return View();
        }

       public IActionResult AddCredit()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddCredit(Credit credit) {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("CREDIT_INSERT", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("c_amount", credit.Amount));
                    cmd.Parameters.Add(new OracleParameter("c_amountleft", credit.AmountLeft));
                    cmd.Parameters.Add(new OracleParameter("c_lendingrate", credit.LendingRate));
                    cmd.Parameters.Add(new OracleParameter("c_name", credit.Name));
                    cmd.Parameters.Add(new OracleParameter("c_ida", HttpContext.Session.GetString("numberacc")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Credit");
                }
            }
        }
        [HttpGet]
        public IActionResult UpCredit(int number)
        {
            HttpContext.Session.SetInt32("IdC", number);
            return View();
        }

       [HttpPost]
        public IActionResult UpCredit(Credit credit)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("CREDIT_UPDATE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("c_amount", credit.Amount));
                    cmd.Parameters.Add(new OracleParameter("c_amountleft", credit.AmountLeft));
                    cmd.Parameters.Add(new OracleParameter("c_lendingrate", credit.LendingRate));
                    cmd.Parameters.Add(new OracleParameter("c_name", credit.Name));
                    cmd.Parameters.Add(new OracleParameter("c_idc", HttpContext.Session.GetInt32("IdC")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Credit");
                }
            }


        }

 


        public IActionResult Deposit()
        {
            List<Deposit> deposits= new List<Deposit>();

            using (OracleConnection conn = new OracleConnection(conString))
            {
                conn.Open();
                using (var cmd = new OracleCommand("DEPOSIT_SELECT", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    OracleParameter p = new OracleParameter("cur", OracleDbType.RefCursor, ParameterDirection.Output);
                    p.Size = 200;
                    cmd.Parameters.Add(p);
                    cmd.Parameters.Add(new OracleParameter("a_ida", HttpContext.Session.GetString("numberacc")));
                    cmd.ExecuteNonQuery();

                    using (var Adapter = new OracleDataAdapter())
                    {
                        var dataSet = new DataSet();
                        var dataSet2 = new DataTable();
                        Adapter.SelectCommand = cmd;
                        Adapter.Fill(dataSet);
                        dataSet2 = dataSet.Tables[0];
                        for (int i = 0; i < dataSet2.Rows.Count; i++)
                        {
                            Deposit depo = new Deposit()
                            {
                                IdD = Convert.ToInt32(dataSet2.Rows[i][0]),
                                Amount = Convert.ToInt32(dataSet2.Rows[i][1]),
                                LendingRate = Convert.ToInt32(dataSet2.Rows[i][2]),
                                DateOfStart = DateTime.Parse(dataSet2.Rows[i][3].ToString()),
                                DateOfEnd = DateTime.Parse(dataSet2.Rows[i][4].ToString()),
                                IdA = Convert.ToInt32(dataSet2.Rows[i][5])
                            };
                            deposits.Add(depo);
                        }

                    }
                }
            }
            return View(deposits);
        }

        [HttpGet]
        public IActionResult AddDeposit()
        {
            return View();
        }


        [HttpPost]
        public IActionResult AddDeposit(Deposit deposit)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("DEPOSIT_INSERT", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("d_amount", deposit.Amount));
                    cmd.Parameters.Add(new OracleParameter("d_lendingrate", deposit.LendingRate));
                    cmd.Parameters.Add(new OracleParameter("d_start", deposit.DateOfStart));
                    cmd.Parameters.Add(new OracleParameter("d_end", deposit.DateOfEnd));
                    cmd.Parameters.Add(new OracleParameter("c_ida", HttpContext.Session.GetString("numberacc")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Deposit");
                }
            }
        }

        [HttpGet]
        public IActionResult AddExpense()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddExpense(Expense expense)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("EXPENSE_INSERT", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("e_amount", expense.Amount));
                    cmd.Parameters.Add(new OracleParameter("e_category", expense.Category));
                    cmd.Parameters.Add(new OracleParameter("e_datee", expense.Datee));
                    cmd.Parameters.Add(new OracleParameter("e_description", expense.Description));
                    cmd.Parameters.Add(new OracleParameter("e_ida", HttpContext.Session.GetString("numberacc")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Expense");
                }
            }
        }

        public IActionResult Credit()
        {
            List<Credit> credits = new List<Credit>();
           
            using (OracleConnection conn = new OracleConnection(conString))
            {
                conn.Open();
                using (var cmd = new OracleCommand("CREDIT_SELECT", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    OracleParameter p = new OracleParameter("cur", OracleDbType.RefCursor, ParameterDirection.Output);
                    p.Size = 200;
                    cmd.Parameters.Add(p);
                    cmd.Parameters.Add(new OracleParameter("a_ida", HttpContext.Session.GetString("numberacc")));
                    cmd.ExecuteNonQuery();

                    using (var Adapter = new OracleDataAdapter())
                    {
                        var dataSet = new DataSet();
                        var dataSet2 = new DataTable();
                        Adapter.SelectCommand = cmd;
                        Adapter.Fill(dataSet);
                        dataSet2 = dataSet.Tables[0];
                        for(int i =0; i< dataSet2.Rows.Count; i++)
                        {
                           
                            Credit credit = new Credit()
                            {
                                IdC = Convert.ToInt32(dataSet2.Rows[i][0]),
                                Amount = Convert.ToInt32(dataSet2.Rows[i][1]),
                                AmountLeft = Convert.ToInt32(dataSet2.Rows[i][2]),
                                LendingRate = Convert.ToInt32(dataSet2.Rows[i][3]),
                                IdA =Convert.ToInt32(dataSet2.Rows[i][4]),
                                Name = dataSet2.Rows[i][5].ToString()
                            };
                            credits.Add(credit);
                        }

                    }
                }
            }
            return View(credits);
        }

        public IActionResult Expense()
        {
            List<Expense> expenses = new List<Expense>();

            using (OracleConnection conn = new OracleConnection(conString))
            {
                conn.Open();
                using (var cmd = new OracleCommand("EXPENSE_SELECT", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    OracleParameter p = new OracleParameter("cur", OracleDbType.RefCursor, ParameterDirection.Output);
                    p.Size = 200;
                    cmd.Parameters.Add(p);
                    cmd.Parameters.Add(new OracleParameter("a_ida", HttpContext.Session.GetString("numberacc")));
                    cmd.ExecuteNonQuery();

                    using (var Adapter = new OracleDataAdapter())
                    {
                        var dataSet = new DataSet();
                        var dataSet2 = new DataTable();
                        Adapter.SelectCommand = cmd;
                        Adapter.Fill(dataSet);
                        dataSet2 = dataSet.Tables[0];
                        for (int i = 0; i < dataSet2.Rows.Count; i++)
                        {
                            Expense exp = new Expense()
                            {
                                IdE = Convert.ToInt32(dataSet2.Rows[i][0]),
                                Amount = Convert.ToInt32(dataSet2.Rows[i][1]),
                                Category = dataSet2.Rows[i][2].ToString(),
                                Datee = DateTime.Parse(dataSet2.Rows[i][3].ToString()),
                                Description = dataSet2.Rows[i][4].ToString(),
                                IdA = Convert.ToInt32(dataSet2.Rows[i][5])
                            };
                            expenses.Add(exp);
                        }

                    }
                }
            }
            return View(expenses);
        }

        [HttpGet]
        public IActionResult UpExpense(int number)
        {
            HttpContext.Session.SetInt32("IdE", number);
            return View();
        }

        [HttpPost]
        public IActionResult UpExpense(Expense expense)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("EXPENSE_Update", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("e_amount", expense.Amount));
                    cmd.Parameters.Add(new OracleParameter("e_category", expense.Category));
                    cmd.Parameters.Add(new OracleParameter("e_datee", expense.Datee));
                    cmd.Parameters.Add(new OracleParameter("e_description", expense.Description));
                    cmd.Parameters.Add(new OracleParameter("e_ide", HttpContext.Session.GetInt32("IdE")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Expense");
                }
            }
        }

        [HttpPost, ValidateAntiForgeryToken]
        public IActionResult AddAccount(Account account)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("ACCOUNT_INSERT", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("a_bank", account.Bank));
                    cmd.Parameters.Add(new OracleParameter("a_numberofacc", account.NumberOfAccount));
                    cmd.Parameters.Add(new OracleParameter("a_balance", account.Balance));
                    cmd.Parameters.Add(new OracleParameter("u_email", HttpContext.Session.GetString("username")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Panel");
                }
            }
        }

        [HttpGet]
        public IActionResult UpAccount(int number)
        {
            HttpContext.Session.SetInt32("IdA", number);
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken]
        public IActionResult UpAccount(Account account)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("ACCOUNT_Update", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("a_bank", account.Bank));
                    cmd.Parameters.Add(new OracleParameter("a_numberofacc", account.NumberOfAccount));
                    cmd.Parameters.Add(new OracleParameter("a_balance", account.Balance));
                    cmd.Parameters.Add(new OracleParameter("a_ida", HttpContext.Session.GetInt32("IdA")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);

                    Conn.Close();
                    return RedirectToAction("/Panel");
                }
            }
        }

        [HttpGet]
        public IActionResult AddIncome()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddIncome(Income income)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("INCOME_INSERT", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("i_amount", income.Amount));
                    cmd.Parameters.Add(new OracleParameter("i_datee", income.Datee));
                    cmd.Parameters.Add(new OracleParameter("i_description", income.Description));
                    cmd.Parameters.Add(new OracleParameter("i_ida", HttpContext.Session.GetString("numberacc")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                    return RedirectToAction("/Income");
                }
            }
        }
        [HttpGet]
        public IActionResult UpIncome(int number)
        {
            HttpContext.Session.SetInt32("IdI", number);
            return View();
        }


        [HttpPost]
        public IActionResult UpIncome(Income income)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("INCOME_UPDATE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("i_amount", income.Amount));
                    cmd.Parameters.Add(new OracleParameter("i_datee", income.Datee));
                    cmd.Parameters.Add(new OracleParameter("i_description", income.Description));
                    cmd.Parameters.Add(new OracleParameter("i_idi", HttpContext.Session.GetInt32("IdI")));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                    return RedirectToAction("/Income");
                }
            }
        }

        [HttpGet]
        public IActionResult DelIncome(int number)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("INCOME_DELETE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("i_id", number));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                }
            }
            return RedirectToAction("Expense");
        }

        [HttpGet]
        public IActionResult DelAccount(int number)
        {
            using (var Conn = new OracleConnection(conString))
            {
                using (var cmd = new OracleCommand("Account_DELETE", Conn)
                {
                    CommandType = CommandType.StoredProcedure
                })
                {
                    Conn.Open();
                    cmd.Parameters.Add(new OracleParameter("a_ida", number));

                    var adapterSQL = new OracleDataAdapter(cmd);
                    var dataSet = new DataSet();
                    adapterSQL.Fill(dataSet);
                    Conn.Close();
                }
            }
            return RedirectToAction("Panel");
        }
        public IActionResult Income()
        {
            List<Income> incomes = new List<Income>();

            using (OracleConnection conn = new OracleConnection(conString))
            {
                conn.Open();
                using (var cmd = new OracleCommand("INCOME_SELECT", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    OracleParameter p = new OracleParameter("cur", OracleDbType.RefCursor, ParameterDirection.Output);
                    p.Size = 200;
                    cmd.Parameters.Add(p);
                    cmd.Parameters.Add(new OracleParameter("a_ida", HttpContext.Session.GetString("numberacc")));
                    cmd.ExecuteNonQuery();

                    using (var Adapter = new OracleDataAdapter())
                    {
                        var dataSet = new DataSet();
                        var dataSet2 = new DataTable();
                        Adapter.SelectCommand = cmd;
                        Adapter.Fill(dataSet);
                        dataSet2 = dataSet.Tables[0];
                        for (int i = 0; i < dataSet2.Rows.Count; i++)
                        {
                            Income income = new Income()
                            {
                                IdI = Convert.ToInt32(dataSet2.Rows[i][0]),
                                Amount = Convert.ToInt32(dataSet2.Rows[i][1]),
                                Datee = DateTime.Parse(dataSet2.Rows[i][2].ToString()),
                                Description = dataSet2.Rows[i][3].ToString(),
                                IdA = Convert.ToInt32(dataSet2.Rows[i][4])
                            };
                            incomes.Add(income);
                        }

                    }
                }
            }
            return View(incomes);
        }
    }
    }
  

