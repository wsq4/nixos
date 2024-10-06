{...}:
{
services.openssh = {
  enable = true;
  # require public key authentication for better security
  settings.PasswordAuthentication = false;
  settings.KbdInteractiveAuthentication = false;
  #settings.PermitRootLogin = "yes";
};

users.users."wsq".openssh.authorizedKeys.keyFiles = [
  ./id_ed25519.pub
];
}
