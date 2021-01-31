/// Represents the result of a single comparison to determine the precise
/// ordering of two values.
///
pub type Order {
  /// Less-than
  Lt

  /// Equal
  Eq

  /// Greater than
  Gt
}

/// Invert an order, so less-than becomes greater-than and greater-than
/// becomes less-than.
///
/// ## Examples
///
///    > reverse(Lt)
///    Gt
///
///    > reverse(Eq)
///    Eq
///
///    > reverse(Lt)
///    Gt
///
pub fn reverse(order: Order) -> Order {
  case order {
    Lt -> Gt
    Eq -> Eq
    Gt -> Lt
  }
}

/// Produce a numeric representation of the order.
///
/// ## Examples
///
///    > to_int(Lt)
///    -1
///
///    > to_int(Eq)
///    0
///
///    > to_int(Gt)
///    1
///
pub fn to_int(order: Order) -> Int {
  case order {
    Lt -> -1
    Eq -> 0
    Gt -> 1
  }
}

/// Compare two Order values to one another, producing a new Order.
///
/// ## Examples
///
///    > compare(Eq, with: Lt)
///    Gt
///
pub fn compare(a: Order, with b: Order) -> Order {
  case a, b {
    x, y if x == y -> Eq
    Lt, _ | Eq, Gt -> Lt
    _, _ -> Gt
  }
}

/// Return the largest of two orders.
///
/// ## Examples
///
///    > max(Eq, Lt)
///    Eq
///
pub fn max(a: Order, b: Order) -> Order {
  case a, b {
    Gt, _ -> Gt
    Eq, Lt -> Eq
    _, _ -> b
  }
}

/// Return the smallest of two orders.
///
/// ## Examples
///
///    > min(Eq, Lt)
///    Lt
///
pub fn min(a: Order, b: Order) -> Order {
  case a, b {
    Lt, _ -> Lt
    Eq, Gt -> Eq
    _, _ -> b
  }
}
