## Cache

**提供一套灵活的缓存工具 支持同步(偏好设置) 支持ORM数据库**

### 安装
```dart
cache:
git:
url: https://github.com/flutter-packagist/cache.git
```

### 使用
#### 一. 偏好设置
```dart
// 初始化
await SpManager.init();
// 缓存数据
SpManager.setBool("name", true);
// 删除
SpManager.remove("name");
// 清空
await SpManager.clear();
```

#### 二. 数据库

1. 初始化
```dart
await DBManager.init();
```

2. 创建表
```dart
class DBTest extends BaseTableModel
```

3. 添加表列属性
```dart
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
```dart
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
```dart
await test1.save();
```

6. 获取数据
```dart
await DBTest().one(where: "age='14'");
```
7. 删除数据
```dart
await DBTest().delete(where: "age=18");
```

8. 更新数据
```dart
await test.update(where: "age='14'");
```

### License
The MIT License (MIT). Please see [License File](LICENSE) for more information.
