{ config, pkgs, ... }:
{
	home.packages = with pkgs; [

		fastfetch

		# archives
	        zip
	        xz
	        unzip
	        p7zip

		 # utils
                ripgrep # recursively searches directories for a regex pattern
                jq # A lightweight and flexible command-line JSON processor
                yq-go # yaml processor https://github.com/mikefarah/yq
                eza # A modern replacement for ‘ls’
                fzf # A command-line fuzzy finder
		
		btop  # replacement of htop/nmon
               	iotop # io monitoring
    		iftop # network monitoring

  	];
	programs.git = {
		enable = true;
		settings.user = {
			name = "toxirr";
			email = "isakulovtohir902@gmail.com";
		};
	};
	programs.zsh = {
		enable = true;
		enableCompletion = true;
	};
	home.stateVersion = "26.05";
}
