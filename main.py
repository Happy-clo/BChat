from concurrent.futures import ThreadPoolExecutor

from context.main import context
from core.login import login
from core.plugin import SimplePluginManager

# 1472871866

if __name__ == '__main__':
    with ThreadPoolExecutor(max_workers=8) as executor:
        # 登录
        login(context.uid)

        # 创建插件管理器
        plugin_manager = SimplePluginManager(executor)
