use crate::context::context::Context;

pub struct Que<'main, T> {
  ques: &'main Vec<Action<T>>
}

type Action<T> = fn(context: &Context<T>) -> &Context<T>;

pub fn aaa () {
  let mut b = Vec::new();
  b.
  let a = Que {
    ques: &b
  };
}

pub fn nothing<'a, T>(context: &'a Context<T>) -> &'a Context<T>  {
  context
}
