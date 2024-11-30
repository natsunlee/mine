{
  enable = true;
  caskArgs.no_quarantine = true;
  global.brewfile = true;

  brews = [ "mas" ];
  
  masApps = {
   "Paprika Recipe Manager 3" = 1303222628;
   "Caffeinated" = 1362171212;
   "Bitwarden" = 1352778147;
   "Outlook" = 985367838;
  };
}
