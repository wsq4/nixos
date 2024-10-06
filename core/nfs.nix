{...}:
{
  fileSystems."/home/wsq/NAS" = {
    device = "nas.si-qi.wang:/volume2/homes/wsq";
    fsType = "nfs";
    options = [ "nfsvers=4.1" "x-systemd.automount" "noauto" ];
  };
}
