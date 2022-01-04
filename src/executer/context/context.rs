use std::collections::HashMap;

pub struct Context<T> {
  global: GlobalContext<T>,
  local: [MemberContext<T>],
}

pub struct Member {
  id: i32,
}

pub struct GlobalContext<T> {
  context: VariableContext<T>,
}

pub struct MemberContext<T> {
  member: Member,
  context: VariableContext<T>,
}

struct VariableContext<T> {
  a: T,
  variables: HashMap<u32, i32>
}