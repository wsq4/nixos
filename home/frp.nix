{ pkgs, ... }: {
    service = {
        frp = {
            enable = true;
            role = "client";
            settings = {
                serverAddr = "exam.cpl.icu";
                serverPort = 1991;

                wsq-psql = {
                    type = "tcp";
                    localIp = "127.0.0.1";
                    localPort = 5432;
                    remotePort = 1994;
                };
            };
        };
    };
}
