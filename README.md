## Cache

Preferences  
1. 提供同步方式获取以及存储  
2. 提供指定类型获取以及存储  
3. 支持枚举方式缓存
 
Database  
 支持ORM方式操作数据库

### Installation
```
cache:
    git:
      url: https://github.com/flutter-packagist/cache.git
```

### Usage
#### 一. Preferences
```
await SpManager.init();
SpManager.setBool("name", true);
SpManager.setString("name", "string");
SpManager.setStringList("name", [1, 2, 3]);
SpManager.getBool("name");
SpManager.getDouble("name", defaultValue: 0);
SpManager.getString("name");
SpManager.getStringList("name");

SpManager.remove("name");
await SpManager.clear();
```

#### 二. Database

1. 初始化
```
await DBManager.init();
```

2. 创建表
```
class DBTest extends BaseTableModel
```

3. 添加表列属性
```
/// 添加表格属性
  @override
  Map<String, BaseColumn> get map => {
    "age": age,
    "name": name,
    "weight": weight,
    "timestamp": timestamp,
    "datetime": datetime,
    "hobby": hobby,
    "girlfriend": girlfriend,
  };
```
4. 完整表例子
```
/// 所有表都必须继承至 BaseTableModel
class DBTest extends BaseTableModel {


  @override
  BaseTableModel copy() => DBTest();

  /// 添加表格属性
  @override
  Map<String, BaseColumn> get map => {
    "age": age,
    "name": name,
    "weight": weight,
    "timestamp": timestamp,
    "datetime": datetime,
    "hobby": hobby,
    "girlfriend": girlfriend,
  };

  DBTest({int? age, String? name, double? weight, List<int>? hobby, int? girlfriend}){
    this.age.content = age ?? 0;
    this.name.content = name ?? "";
    this.weight.content = weight ?? 0.0;
    timestamp.content = DateTime.now().millisecondsSinceEpoch;
    datetime.content = "2022-01-26";
    this.hobby.content = hobby;
    this.girlfriend.content = girlfriend;
  }


  STInt uId = STInt(canNull: false, primaryKey: true, autoIncrement: true, defaultValue: 200);
  STInt age = STInt(canNull: false);
  STText name = STText(canNull: true);
  STDouble weight = STDouble(canNull: false);
  STTimestamp timestamp = STTimestamp();
  STDatetime datetime = STDatetime();
  STSet hobby = STSet(setList: ["篮球", "足球", "乒乓球", "羽毛球", "跑步"]);
  STEnum girlfriend = STEnum(enumList: ["张三", "李四", "王五", "天线宝宝", "光头强"]);
}
```


5. 保存数据
```
await test1.save();
```

6. 获取数据
```
await DBTest().one(where: "age='14'");
```
7. 删除数据
```
await DBTest().delete(where: "age=18");
```

8. 更新数据
```
await test.update(where: "age='14'");
```

### License
The MIT License (MIT). Please see [License File](LICENSE) for more information.
