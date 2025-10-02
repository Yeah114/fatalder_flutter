#include "my_application.h"
#include <cstdlib>

int main(int argc, char** argv) {
  // 设置 fontconfig 配置以支持中文字体
  setenv("FONTCONFIG_FILE", "linux/flutter/ephemeral/.font_config.xml", 0);

  g_autoptr(MyApplication) app = my_application_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
