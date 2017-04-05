function neofetch2
	rm -rf ~/.cache/thumbnails/neofetch/*.*; and neofetch --config on --block_range 0 15 --bold off --uptime-shorthand on --gtk_shorthand on --colors 7 1 3 3 3 7 $argv;
end
