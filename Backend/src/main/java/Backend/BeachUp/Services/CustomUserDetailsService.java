package Backend.BeachUp.Services;

import Backend.BeachUp.Models.JogadorModel;
import Backend.BeachUp.Models.Empresa;
import Backend.BeachUp.Repositorys.JogadorRepository;
import Backend.BeachUp.Repositorys.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private EmpresaRepository empresaRepository;

    @Autowired
    private JogadorRepository jogadorRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {


        Optional<Empresa> usuario = empresaRepository.findByEmail(email);
        if (usuario.isPresent()) {
            return usuario.get();
        }


        Optional<JogadorModel> jogador = jogadorRepository.findByEmail(email);
        if (jogador.isPresent()) {
            return jogador.get();
        }

        throw new UsernameNotFoundException("Usuário não encontrado");
    }
}
