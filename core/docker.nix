{...}:
{
    virtualisation.docker.enable = true;
    users.users.wsq.extraGroups = [ "docker" ];
    virtualisation.docker.storageDriver = "btrfs";
}
