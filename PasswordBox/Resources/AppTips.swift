import TipKit

struct AppTips {
    struct ChangeIcon: Tip {
        var title: Text {
            Text("アイコンとタイトルを変更")
        }
        var message: Text? {
            Text("アイコンとタイトルはこちらから編集することができます。")
        }
    }

}
