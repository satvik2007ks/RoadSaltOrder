namespace SaltOrderForm
{
    public class OrderDetails
    {
        public string name { get;  set;}
        public string address { get; set; }
        public string city { get; set; }
        public string zip { get; set; }
        public string unloadmethod { get; set; }
        public string untreatedsaltqty { get; set; }
        public string untreatedqtyType { get; set; }
        public string treatedsaltqty { get; set; }
        public string treatedqtyType { get; set; }
        public bool earlyFill { get; set; }
        public string earlyFilluntreatedsaltqty { get; set; }
        public string earlyFilluntreatedsaltqtyType { get; set; }
        public string earlyFilltreatedsaltqty { get; set; }
        public string earlyFilltreatedsaltqtyType { get; set; }
    }
}