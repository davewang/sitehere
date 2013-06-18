local User = class("User",require("framework.shared.ModelBase"))
-- schema 指定对象有哪些属性，以及属性的类型和默认值
User.schema = {
    id       = {"string"},      -- id 存储用户 ID
    username = {"string"},      -- username 存储用户名
    scores   = {"number", 0},   -- scores 存储用户的得分，默认为 0
}
User.fields = {"id", "username", "scores" }

function User:ctor(properties)
    self.id = properties.id or nil
    self.username = properties.username or nil
    self.scores = properties.scores or nil
end


return User
