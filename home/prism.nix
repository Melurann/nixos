{...}: {
  programs.prismlauncher = {
    enable = true;

    (override {
    additionalPrograms = [ ffmpeg ];

    jdks = [
      graalvm-ce
      zulu8
      zulu17
      zulu
    ];
  })
  }
}
