#### 1.运行说明
1. 用到了一个maven仓库中没有的jar包，目录`lib/patchca-0.5.0.jar`。为了可以使用maven打包，需要先安装在本地(注意切换到相应目录)
`mvn install:install-file -Dfile=patchca-0.5.0.jar -DgroupId=org.patchca -DartifactId=patchca -D version=0.5.0 -D packaging=jar
`
2. sql脚本在文件夹`resources/db/migration`下，这里用到了数据库迁移工具[flyway](http://flywaydb.org)	最初给你的sql脚本被删掉了，所以你先把你本地数据库清空(所有表删掉)，运行时即可导入所有表
--
#### 2.使用说明

1. 后台管理页面在 {base}/admin下。 (base为根目录，如 localhost:8080/)
2. 初始管理员用户账户密码为 admin/admin
