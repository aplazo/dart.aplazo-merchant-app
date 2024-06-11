enum InformationErrorFlow {
  checkout('Checkout'),
  orders('Ordenes'),
  addReplaceCard('AgregarTarjeta'),
  signup('SignUp'),
  virtualCard('TarjetaVirtual'),
  merchants('Merchants');

  const InformationErrorFlow(this.flow);
  final String flow;
}
