1、新建数据库</br>
crate tabe xxx</br>
2、修改数据库连接</br>
修改：config.properties</br>
必须配置：schema,jdbc_url,jdbc_username,jdbc_password 即可；</br>
3、src/templete Build Path</br>
4、配置生成文件路径</br>
修改GeneratorCode.java中相关配置属性</br>
5、生成文件</br>
执行GeneratorCode.java的main方法，会弹出生成文件</br>
6、拷贝文件到所在工程路径下</br>
拷贝文件到您的工程</br>
7、完成</br>
<hr>
重启项目，访问对应路径，ok</br>