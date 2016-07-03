Table names;
Table countries;

Table data;

void setup() {
  data = loadTable("data.csv");
  println("Number of Rows: " + data.getRowCount());
    
  names = new Table();
  names.addColumn("Name");
  
  countries = new Table();
  countries.addColumn("Country");
  
  String cell;
  String filter;
  
  // Name Filter
  filter = "Contact Buyer: ";
  String nameFlag, name;
  for(int i=0; i<data.getRowCount(); i++) {
    for(int j=0; j<data.getColumnCount(); j++) {
      cell = data.getString(i, j);
      // Filter for Name
      nameFlag = cell.substring(0,filter.length());
      // If Name of buyer, save to 'names' Arraylist<>
      if (nameFlag.equals(filter) ) {
        // Catches all characters following first 15
        name = cell.substring(filter.length());
        TableRow entry = names.addRow();
        entry.setString("Name", name);
      }
    }
  }
  
  // Country Filter
  filter = "Billing Country: ";
  String countryFlag, country;
  for(int i=0; i<data.getRowCount(); i++) {
    for(int j=0; j<data.getColumnCount(); j++) {
      cell = data.getString(i, j);
      // Filter for Name
      countryFlag = cell.substring(0,filter.length());
      // If Name of buyer, save to 'countries' Arraylist<>
      if (countryFlag.equals(filter) ) {
        // Catches all characters following first 15
        country = cell.substring(filter.length());
        TableRow entry = countries.addRow();
        entry.setString("Country", country);
      }
    }
  }
  
  saveTable(names, "names.csv");
  saveTable(countries, "countries.csv");
}
