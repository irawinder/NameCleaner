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
  
  String nameFilter = "Contact Buyer:";
  String nameFlag, name;
  
  String countryFilter = "Billing Country:";
  String countryFlag, country;
  
  for(int i=0; i<data.getRowCount(); i++) {
    for(int j=0; j<data.getColumnCount(); j++) {
      
      // Get Cell Value
      if (data.getString(i, j) == null) {
        cell = "";
      } else {
        cell = data.getString(i, j);
      }
      
      // Filter for Name
      if (cell.length() >= nameFilter.length()) {
        nameFlag = cell.substring(0,nameFilter.length());
      } else {
        nameFlag = "";
      }
      
      // If Name of buyer, save to 'names' Table
      if (nameFlag.equals(nameFilter) ) {
        // Catches all characters following first 15
        name = cell.substring(nameFilter.length() + 1);
        TableRow entry = names.addRow();
        entry.setString("Name", name);
      }
      
      // Filter for Country
      if (cell.length() >= countryFilter.length()) {
        countryFlag = cell.substring(0,countryFilter.length());
      } else {
        countryFlag = "";
      }
      
      // If Name of country, save to 'countries' Table
      if (countryFlag.equals(countryFilter) ) {
        // Catches all characters following first 15
        country = cell.substring(countryFilter.length() + 1);
        TableRow entry = countries.addRow();
        entry.setString("Country", country);
      }
      
    }
  }
  
  saveTable(names, "names.csv");
  saveTable(countries, "countries.csv");
}
