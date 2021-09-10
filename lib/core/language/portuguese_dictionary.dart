import 'package:capimobile/core/language/language_dictionary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PortugueseDictionary implements LanguageDictionary {
  @override
  String get Surveys => 'Levantamentos';
  @override
  String get Best_Practices => 'Boas práticas';
  @override
  String get My_Surveys => 'Meus Levantamentos';
  @override
  String get Edit => 'Editar';
  @override
  String get Calculate => 'Calcular';
  @override
  String get Results => 'Resultados';
  @override
  String get New_Survey => 'Novo Levantamento';
  @override
  String get Warning => 'Aviso';

  @override
  String get SURVEY_DELETION_CONFIRMATION =>
      'Deseja realmente excluir o levantamento selecionado?';

  @override
  String get Yes => 'Sim';

  @override
  String get No => 'Não';

  @override
  String get FastAndFurious => 'Velozes e furiosos';

  @override
  String get FastAndFuriousTEXT =>
      'Sempre use cartões de memória bons e rápidos para evitar imagens corrompidas. Ao salvar as imagens em formato RAW, geralmente há um atraso de 1 a 2 segundos para a gravação da imagem no cartão. Fotografar em intervalos menores que esse corrompe os dados, o que é fácil de acontecer principalmente se a aquisição está sendo feita de maneira manual. Adaptadores de cartão mini SD também atrasam o processo de gravação, por isso é importante conhecer e respeitar as limitações do equipamento de antemão. Em RPAs esse atraso é computado no planejamento da missão, no tempo que a aeronave demora para ir de um ponto a outro. Uma recomendação que pode evitar surpresas no retorno ao escritório é levar um notebook para o campo, descarregar e conferir as imagens antes de encerrar as atividades;\n\nApesar da aquisição das imagens não poder ser feita de maneira muito rápida, o processo também não pode demorar muito, uma vez que a luminosidade pode variar tanto em posição como em qualidade neste período (por exemplo com o surgimento de uma nuvem). Se possível fotografe pela manhã e à tarde;';

  @override
  String get FixedPointInTime => 'Um ponto fixo no tempo';

  @override
  String get FixedPointInTimeTEXT =>
      'É importante utilizar marcadores permanentes para os pontos do DGPS e da ET pois caso seja necessário realizar outro levantamento, os pontos podem ser ocupados novamente rapidamente, sem a necessidade de um novo levantamento. Se possível, coloque pelo menos um par de marcadores (como, por exemplo, parafusos chumbados) distantes entre si no afloramento, para que na ocasião de um novo levantamento, suas coordenadas possam ser utilizadas para zerar a estação total;';

  @override
  String get GetTheBigPcture => 'Entenda o quadro geral';

  @override
  String get GetTheBigPctureTEXT =>
      'Fotos panorâmicas e à distância do afloramento podem ser utilizadas para a geração de um modelo 3D grosseiro preliminar - que, no caso do uso de notebook, pode ser feito em campo em baixa qualidade, o que não consome muito processamento - para auxiliar no planejamento das etapas de campo, como no posicionamento dos alvos e efeitos da iluminação. Estas imagens também podem servir de guia no escritório, durante a análise e interpretação;';

  @override
  String get KnowThyEnemy => 'Conheça seu inimigo';

  @override
  String get KnowThyEnemyTEXT =>
      'É importante conhecer a área com antecedência. Faça uma visita e cheque as vias de acesso, locais para estacionar o veículo, locais para o posicionamento da ET e DGPS, e também as limitações físicas do terreno (você consegue chegar perto do talude ou precisa de lentes telescópicas? Existem estruturas que podem atrapalhar o sobrevoo?). Um simples passeio pelo Google Earth não é suficiente para planejar as atividades de maneira adequada.';

  @override
  String get LetThereBeLight => 'Faça-se a luz';

  @override
  String get LetThereBeLightTEXT =>
      'Uma boa iluminação é ponto chave para a construção de um bom modelo com SfM-MVS, e sombras devem ser evitadas. O ideal é que as imagens sejam feitas em dias claros, parcialmente nublados. Planejar a ordem das atividades de campo ajuda a aproveita o melhor momento de luminosidade. Se seu afloramento não for muito grande, e você quiser fazer todo o trabalho em dia, posicione os alvos no talude e tire as fotos antes das outras atividades, para aproveitar a iluminação do meio da manhã. Evite dias muito ensolarados, pois a projeção de sombras será mais intensa. Existem diversos aplicativos que ajudam a rastrear a posição do sol (e das sombras) para qualquer lugar na Terra em qualquer dia e horário. Fontes de luz artificiais podem ser usadas, quando possível, lembrando de sempre que são necessárias duas fontes luminosas para que a fonte não seja identificável nas imagens;';

  @override
  String get PowerToThePeople => 'Energia na veia';

  @override
  String get PowerToThePeopleTEXT =>
      'Os procedimentos de campo consomem muita bateria dos equipamentos, principalmente se a área de interesse for muito extensa. Garanta que todas as baterias estão carregadas, inclusive sobressalentes quando disponíveis, e tenha sempre à mão um power bank, que pode carregar pequenos aparelhos sem que haja a necessidade de retornar ao escritório.';

  @override
  String get RomeWasntBuildInADay => 'Roma não foi construída em um dia';

  @override
  String get RomeWasntBuildInADayTEXT =>
      'Sempre planeje mais de um dia de campo (ou mais de uma viagem curta). O planejamento deve levar em conta o tempo gasto para a aquisição dos pontos de controle, que normalmente tomam o dia todo, e que as coordenadas só estarão disponíveis após o processamento no escritório. No caso de a equipe ser grande, as tarefas podem ser divididas, mas normalmente o levantamento dos pontos, aquisição das imagens e levantamento de dados de campo (descrição da rocha, medida de estruturas, etc.) levará mais de um dia;';

  @override
  String get Email => 'E-mail';

  @override
  String get ForgotPassword => 'Esqueci minha senha';

  @override
  String get LogIn => 'Entrar';

  @override
  String get LoginViaGoogle => 'Usar conta Google';

  @override
  String get Name => 'Nome';

  @override
  String get Password => 'Senha';

  @override
  String get SignUp => 'Registrar';

  @override
  String get RecoverPassword => 'Recuperar Senha';

  @override
  String get UserProfile => 'Perfil de Usuário';

  @override
  String get CameraName => 'Nome da câmera';

  @override
  String get Dimensions => 'Dimensões';

  @override
  String get FocalLength => 'Distância focal';

  @override
  String get FrontOverlap => 'Superposição frontal';

  @override
  String get Gsd => 'GSD';

  @override
  String get HorizontalStructures => 'Estruturas horizontais';

  @override
  String get OutcropDistance => 'Distância ao afloramento';

  @override
  String get OutcropHeight => 'Altura do afloramento';

  @override
  String get OutcropWidth => 'Largura do afloramento';

  @override
  String get PhotoOrientation => 'Orientação da câmera';

  @override
  String get SensorHeightMm => 'Altura do sensor (mm)';

  @override
  String get SensorHeightPx => 'Altura do sensor (px)';

  @override
  String get SensorWidthMm => 'Largura do sensor (mm)';

  @override
  String get SersorWidthPx => 'Largura do sensor (px)';

  @override
  String get SideOverlap => 'Superposição lateral';

  @override
  String get VerticalStructures => 'Estruturas Verticais';

  @override
  String get CameraModel => 'Modelo de câmera';

  @override
  String get Login => 'Login';

  @override
  String get Required => 'Obrigatório';

  @override
  String get NoSurveysYet => 'Nenhum levantamento salvo';

  @override
  String get Cancel => 'Cancelar';

  @override
  String get Ok => 'Ok';

  @override
  String get Save => 'Salvar';

  @override
  String get RepeatedName => 'Nome repetido';

  @override
  String get SuccessfullySaved => 'Salvo com sucesso';

  @override
  String get Loading => 'Carregando...';

  @override
  String get RegisterNewCamera => 'Cadastrar nova câmera';

  @override
  String get CAMERA_DELETION_CONFIRMATION =>
      'Deseja realmente excluir o levantamento selecionado?';

  @override
  String get LoginError => 'Erro de login';

  @override
  String get SigUpRequested => 'Registro solicitado';

  @override
  String get EmailNotVerified => 'E-mail não verificado';
  @override
  String get PASSWORD_SIZE_ERROR => 'A senha deve conter 8 caracteres ou mais';

  @override
  String get Landscape => 'Paisagem';
  @override
  String get Portrait => 'Retrato';

  @override
  String formatTimeStampToDate(Timestamp date) {
    return ('${date.toDate().day}/${date.toDate().month}/${date.toDate().year}');
  }

  @override
  String get APPNAME => 'SurvAid';

  @override
  String get CameraData => 'Dados de Câmera';

  @override
  String get Capture => 'Captura';

  @override
  String get DateOfCreation => 'Data de criação';

  @override
  String get FootPrint => 'Footprint';

  @override
  String get Based_on => 'Baseado em "Best Practices For Fieldwork" de ';

  @override
  String get OutcropData => 'Dados do afloramento';

  @override
  String get OverlapConfiguration => 'Configuração de superposição';

  @override
  String get ProvidedData => 'Dados Fornecidos';

  @override
  String get SurveyOverview => 'Resumo do Levantamento';

  @override
  String get SurveyName => 'Nome do Levantamento';

  @override
  String get AmountOfPhotos => 'Total de fotos';

  @override
  String get EstimatedProcessTime => 'Tempo estimado de processamento';

  @override
  String get FootPrintHeight => 'Altura do Footprint';

  @override
  String get FootprintWidth => 'Largura do Footprint';

  @override
  String get NumberOfLines => 'Número de linhas';

  @override
  String get PhotosPerSpot => 'Fotos por ponto';

  @override
  String get SpaceBetweenLines => 'Espaço entre as linhas';
  @override
  String get SpaceBetweenPhotos => 'Espaço entre as fotos';

  @override
  String get CaptureAndProcessing => 'Captura e Processamento';

  @override
  String get UnavailableData => 'Dado indisponível';

  @override
  String get OVERLAP_ERROR => 'Erro! Verifique o valor de superposição';

  @override
  String get OpenPDF => 'Visualizar PDF';

  @override
  String get CLEAR_ALL_FIELDS_CONFIRMATION =>
      'Restaurar todos os campos para os valores padrões?';

  @override
  String get RESTORE_TO_PREVIOUS_STATE_CONFIRMATION =>
      'Restaurar todos os campos para o último estado salvo?';

  @override
  String get General => 'Outros';

  @override
  String get QRCodeExport => 'Exportar por Código QR';

  @override
  String get QR_CODE_INSTRUCTIONS =>
      'Para importar via QR Code abra a página "Meus Levantamentos", Selecione a opção de importar por código QR e escaneie esse código';

  @override
  String get ManualInput => 'Inserção Manual';

  @override
  String get QrCodeImport => 'Importar por código QR';

  @override
  String get QrCodeError => 'Erro no código QR';

  @override
  String get About => 'Sobre';

  @override
  String get AboutMetashape => 'Sobre o Metashape';

  @override
  String get ABOUT_METASHAPE_CPU =>
      'A unidade central de processamento (Central Process Unity) é o cérebro do computador. Ela é responsável por realizar as tarefas e cálculos do processamento. Ela influencia diretamente na velocidade de processamento.';

  @override
  String get ABOUT_METASHAPE_DEVELOPMENT =>
      'Quem já tentou gerar um modelo, sabe que este processo pode demorar muito, e até mesmo ser inviável dependendo do seu computador. Pensando nisso, resolvemos reunir algumas informações úteis nesta seção, que podem te ajudar a compor o equipamento ideal para sua aplicação ou estimar quanto tempo levará para processar seus dados.';

  @override
  String get ABOUT_METASHAPE_GPU =>
      'Já a unidade de processamento gráfico (Graphics Processing Unit) é usada especificamente para atividades gráficas, trabalhando em paralelo com a CPU e ajudando a dividir as tarefas e acelerar o processamento. Apesar de não ser um item essencial, é altamente recomendado, pois os cálculos envolvendo gráficos são complexos, e a CPU pode demorar muito se tiver que realizá-los sozinha.';

  @override
  String get ABOUT_METASHAPE_INTRO =>
      ' (antes Photoscan) se tornou um dos programas mais populares para a geração de modelos 3D baseado em SfM-MVS. Possui uma interface simples e intuitiva, e a empresa mantém um bom acervo de manuais e tutoriais, além de um fórum que pode resolver a grande maioria das suas dúvidas.';

  @override
  String get ABOUT_METASHAPE_OUTRO =>
      'Primeiro, vamos entender quais são os três componentes básicos do seu computador que o programa usa:';

  @override
  String get ABOUT_METASHAPE_RAM =>
      'A memória de acesso aleatório (Random Access Memory) é o espaço temporário onde o programa armazena todos os dados que serão usados e produzidos durante uma determinada etapa de processamento. ';

  @override
  String get Cpu => 'CPU';

  @override
  String get Gpu => 'GPU';

  @override
  String get Ram => 'RAM';

  @override
  String get Licenses => 'Licenças';

  @override
  String get Author => 'Autor';

  @override
  String get LicenseType => 'Tipo de Licença';

  @override
  String get Version => 'Versão';

  @override
  String get Description => 'Descrição';

  @override
  String get ABOUT_METASHAPE_AT_AGiSOFT =>
      'No site da Agisoft você pode encontrar a ';

  @override
  String get ABOUT_METASHAPE_A_USEFUL_TIP => 'Uma dica importante:';
  @override
  String get ABOUT_METASHAPE_A_USEFUL_TIP_CONTINUATION =>
      ' sempre que instalar ou atualizar o Metashape, vá em Ferramentas > Preferências > GPU, e selecione todos os seus dispositivos GPU e desmarque a opção de usar a CPU durante o processamento de GPU. Isso irá garantir que, sempre que for possível a aceleração por GPU, o programa escolha rodar exclusivamente nas unidades de processamento gráfico.';

  @override
  String get ABOUT_METASHAPE_BASIC_CONFIGURATION =>
      'configuração básica recomendada pelo fabricante';

  @override
  String get ABOUT_METASHAPE_CPU_WITH =>
      ': CPU da 4 a 8 núcleos, Intel ou AMD, com pelo menos 2.0 GHz; 16 a 32 GB de memória RAM; e GPU NVIDIA ou AMD com pelo menos 700 núcleos.';

  @override
  String get ABOUT_METASHAPE_ON_YOUR_COMPUTER => '.';

  @override
  String get ABOUT_METASHAPE_TEST_RESULTS =>
      'teste de benchmark da Puget Systems';

  @override
  String get ABOUT_METASHAPE_THEIR_RECOMMENDATIONS =>
      ', que analisa o desempenho de diversos modelos de CPUs e GPUs. Essas recomendações serão úteis se você estiver interessado em comprar um novo computador ou adaptar o seu para usar o Metashape.';

  @override
  String get ABOUT_METASHAPE_THIS_LIST =>
      'Essa lista cobre apenas o básico, ou seja, garante que o programa conseguirá rodar no seu computador. Porém, para saber sobre a performance, recomendamos que você dê uma olhada nos resultados do ';

  @override
  String get ABOUT_METASHAPE_YOU_CAN =>
      'Você também pode rodar o teste no seu computador e ';

  @override
  String get ABOUT_METASHAPE_RUN_THE_BENCHMARK =>
      'avaliar o desempenho da sua máquina';

  @override
  String get ABOUT_INTRO =>
      'Este aplicativo foi desenvolvido como parte da pesquisa de doutorado de CD Viana, no Instituto de Geociências da Universidade de São Paulo. Trata-se de uma primeira tentativa de sistematizar as informações mais relevantes sobre o levantamento de imagens para a geração de modelos 3D de taludes usando Structure from Motion - Multi-view Stereo. Tem por objetivo auxiliar não especialistas no levantamento de campo.';
  @override
  String get ABOUT_INTRO_WEB =>
      'Este site foi desenvolvido como parte da pesquisa de doutorado de CD Viana, no Instituto de Geociências da Universidade de São Paulo. Trata-se de uma primeira tentativa de sistematizar as informações mais relevantes sobre o levantamento de imagens para a geração de modelos 3D de taludes usando Structure from Motion - Multi-view Stereo. Tem por objetivo auxiliar não especialistas no levantamento de campo.';

  @override
  String get SaveBeforeLeavingThePage => 'Salvar o projeto antes de sair?';

  @override
  String get ClearAll => 'Limpar Tudo';
  @override
  String get Undo => 'Desfazer';

  @override
  String get ABOUT_ARTHUR =>
      ' Engenheiro Eletricista, com ênfase em sistemas eletrônicos, M.Sc.. Pesquisador do Laboratório de Sistemas Integráveis da Escola Politécnica da Universidade de São Paulo.';
  @override
  String get ABOUT_CAMILA =>
      ' Geóloga, M.Sc.. Estudante de Engenharia de Computação. Desde 2013 pesquisa e trabalha com SfM-MVS.';
  @override
  String get About_the_Authors => 'Sobre os autores';

  @override
  String get Resend_confirmation_email => 'Reenviar e-mail de confirmação?';

  @override
  String get HELP_DIMENSIONS_CONSIDER =>
      'Considere como altura a dimensão vertical do afloramento, e como largura a horizontal. No caso de o afloramento ser horizontal, considere como largura a maior dimensão.';
  @override
  String get HELP_DIMENSIONS_TO_DETERMINE =>
      'Para determinar o nível de detalhe das imagens, são fornecidas duas possibilidades:';
  @override
  String get HELP_DIMENSIONS_SET_OUTCROP =>
      'Definir a distância ao afloramento';
  @override
  String get HELP_DIMENSIONS_SET_OUTCROP_TEXT =>
      'Este caso é pensado, principalmente, quando existem restrições na distância que a câmera pode estar do afloramento.';
  @override
  String get HELP_DIMENSIONS_SET_GSD => 'Definir o GSD';
  @override
  String get HELP_DIMENSIONS_SET_GSD_TEXT =>
      'GSD (Ground Sampling Distance) é uma medida teórica que, em função da distância da câmera ao objeto e da geometria da câmera, calcula quanto cada pixel da imagem representa em medida real.';

  @override
  String get HELP_GENERAL_SIDE_OVERLAP_TEXT =>
      'Superposição entre as imagens de uma mesma linha.';

  @override
  String get HELP_GENERAL_FRONTAL_OVERLAP_TEXT =>
      'Superposição entre duas linhas diferentes.';
  @override
  String get HELP_GENERAL_STRUCTURES => 'Estruturas';
  @override
  String get HELP_GENERAL_STRUCTURES_TEXT =>
      'Se o afloramento apresentar estruturas persistentes, como por exemplo falhas ou fraturas, marque as opções de acordo com a orientação aproximada (vertical e/ou horizontal). Isso adicionará imagens inclinadas ao conjunto, garantindo maior cobertura.';

  @override
  String get HELP_GENERAL_CAMERA_ORIENTATION_P1 =>
      'Para otimizar o número de linhas, elas devem ser perpendiculares à menor dimensão do afloramento, e a maior dimensão do sensor deve ser perpendicular às linhas.';
  @override
  String get HELP_GENERAL_CAMERA_ORIENTATION_P2 =>
      'Em um afloramento vertical retangular, as linhas são otimizadas quando a câmera de mão é usada na posição retrato.';
  @override
  String get HELP_GENERAL_CAMERA_ORIENTATION_P3 =>
      'Usando um drone em missão vertical, a câmera obrigatoriamente ficará em posição paisagem, o que diminui o número de fotos por linha e aumenta o número de linhas.';
}
