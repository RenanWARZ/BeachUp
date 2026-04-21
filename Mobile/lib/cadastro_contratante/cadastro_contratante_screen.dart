import 'package:flutter/material.dart';

class CadastroContratanteScreen extends StatefulWidget {
  const CadastroContratanteScreen({super.key});

  @override
  State<CadastroContratanteScreen> createState() =>
      _CadastroContratanteScreenState();
}

class _CadastroContratanteScreenState
    extends State<CadastroContratanteScreen> {

  final _formKey = GlobalKey<FormState>();

  final nomeEmpresaController = TextEditingController();
  final cnpjController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void cadastrar() {
    if (_formKey.currentState!.validate()) {
      final data = {
        "nomeEmpresa": nomeEmpresaController.text,
        "cnpj": cnpjController.text,
        "email": emailController.text,
        "senha": senhaController.text,
        "tipo": "contratante"
      };
        
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cadastro realizado com sucesso!"),
        ),
      );

    }
  }

  @override
  void dispose() {
    nomeEmpresaController.dispose();
    cnpjController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 241, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Row(
          children: [
            Image.asset(
              'assets/logo1.png',
              height: 28,
            ),
            const SizedBox(width: 6),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Beach ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'Up',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 10),

                    const Text(
                      "Cadastre sua empresa",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    _campo(
                      controller: nomeEmpresaController,
                      label: "Nome da empresa",
                      validator: (value) =>
                          value == null || value.isEmpty ? "Nome é obrigatório" : null,
                    ),

                    _campo(
                      controller: cnpjController,
                      label: "CNPJ",
                      keyboard: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "CNPJ é obrigatório";
                        if (value.length < 14) return "CNPJ inválido";
                        return null;
                      },
                    ),

                    _campo(
                      controller: emailController,
                      label: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Email é obrigatório";
                        if (!value.contains("@")) return "Email inválido";
                        return null;
                      },
                    ),

                    _campo(
                      controller: senhaController,
                      label: "Senha",
                      isSenha: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Senha obrigatória";
                        return null;
                      },
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: cadastrar,
                        child: const Text("Cadastrar"),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta? ",
                            style: TextStyle(color: Colors.orange),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login'); ////rota tela de login
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _campo({
    required TextEditingController controller,
    required String label,
    bool isSenha = false,
    TextInputType keyboard = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        obscureText: isSenha,
        keyboardType: keyboard,
        validator: validator,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.orange),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}