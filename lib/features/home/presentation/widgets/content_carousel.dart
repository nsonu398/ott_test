// lib/features/home/presentation/widgets/content_carousel.dart

import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../widgets/content_card.dart';
import '../../domain/entities/content_entity.dart';

class ContentCarousel extends StatelessWidget {
  final String contentType;

  const ContentCarousel({
    Key? key,
    required this.contentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In a real app, this would come from a repository or BLoC
    // For now we'll use mock data
    List<ContentEntity> getMockContent() {
      switch (contentType) {
        case 'trending':
          return _getTrendingContent();
        case 'movies':
          return _getMoviesContent();
        case 'tv':
          return _getTvShowsContent();
        case 'recent':
          return _getRecentContent();
        default:
          return _getTrendingContent();
      }
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: getMockContent().length,
      itemBuilder: (context, index) {
        final content = getMockContent()[index];
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ContentCard(content: content),
        );
      },
    );
  }

  // Mock data generators
  List<ContentEntity> _getTrendingContent() {
    return [
      ContentEntity(
        id: '1',
        title: 'Stranger Things',
        description: 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.5,
        releaseYear: 2016,
        categories: ['Sci-Fi', 'Horror'],
        duration: '50 min',
        isOriginal: true,
      ),
      ContentEntity(
        id: '2',
        title: 'Money Heist',
        description: 'A criminal mastermind who goes by "The Professor" has a plan to pull off the biggest heist in history.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.3,
        releaseYear: 2017,
        categories: ['Crime', 'Thriller'],
        duration: '45 min',
      ),
      ContentEntity(
        id: '3',
        title: 'The Witcher',
        description: 'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.2,
        releaseYear: 2019,
        categories: ['Fantasy', 'Adventure'],
        duration: '60 min',
        isOriginal: true,
      ),
      ContentEntity(
        id: '4',
        title: 'Breaking Bad',
        description: 'A high school chemistry teacher turned methamphetamine manufacturer partners with an ex-student.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.8,
        releaseYear: 2008,
        categories: ['Crime', 'Drama'],
        duration: '50 min',
      ),
      ContentEntity(
        id: '5',
        title: 'The Queen\'s Gambit',
        description: 'Orphaned at a young age, a prodigious chess player struggles with addiction on her way to becoming a world champion.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.4,
        releaseYear: 2020,
        categories: ['Drama', 'Sport'],
        duration: '60 min',
        isOriginal: true,
      ),
    ];
  }

  List<ContentEntity> _getMoviesContent() {
    return [
      ContentEntity(
        id: '6',
        title: 'The Irishman',
        description: 'An aging hitman recalls his time with the mob and his involvement with Jimmy Hoffa.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.0,
        releaseYear: 2019,
        categories: ['Crime', 'Drama'],
        duration: '3h 30m',
        isOriginal: true,
      ),
      ContentEntity(
        id: '7',
        title: 'Inception',
        description: 'A thief who steals corporate secrets through the use of dream-sharing technology.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.7,
        releaseYear: 2010,
        categories: ['Sci-Fi', 'Action'],
        duration: '2h 28m',
      ),
      ContentEntity(
        id: '8',
        title: 'The Dark Knight',
        description: 'Batman faces his greatest challenge as the Joker wreaks havoc on Gotham City.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.9,
        releaseYear: 2008,
        categories: ['Action', 'Crime'],
        duration: '2h 32m',
      ),
      ContentEntity(
        id: '9',
        title: 'The Matrix',
        description: 'A computer hacker learns from mysterious rebels about the true nature of his reality.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.5,
        releaseYear: 1999,
        categories: ['Sci-Fi', 'Action'],
        duration: '2h 16m',
      ),
      ContentEntity(
        id: '10',
        title: 'Parasite',
        description: 'Greed and class discrimination threaten the newly formed symbiotic relationship between a wealthy family and a destitute one.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.6,
        releaseYear: 2019,
        categories: ['Thriller', 'Drama'],
        duration: '2h 12m',
      ),
    ];
  }

  List<ContentEntity> _getTvShowsContent() {
    return [
      ContentEntity(
        id: '11',
        title: 'Game of Thrones',
        description: 'Nine noble families fight for control over the lands of Westeros.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.7,
        releaseYear: 2011,
        categories: ['Fantasy', 'Drama'],
        duration: '60 min',
      ),
      ContentEntity(
        id: '12',
        title: 'The Crown',
        description: 'Follows the political rivalries and romance of Queen Elizabeth II\'s reign.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.3,
        releaseYear: 2016,
        categories: ['Drama', 'History'],
        duration: '58 min',
        isOriginal: true,
      ),
      ContentEntity(
        id: '13',
        title: 'Peaky Blinders',
        description: 'A gangster family epic set in Birmingham, England, in 1919.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.5,
        releaseYear: 2013,
        categories: ['Crime', 'Drama'],
        duration: '55 min',
      ),
      ContentEntity(
        id: '14',
        title: 'Chernobyl',
        description: 'In April 1986, an explosion at the Chernobyl nuclear power plant becomes one of the world\'s worst man-made catastrophes.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.9,
        releaseYear: 2019,
        categories: ['Drama', 'History'],
        duration: '65 min',
      ),
      ContentEntity(
        id: '15',
        title: 'Black Mirror',
        description: 'An anthology series exploring a twisted high-tech world.',
        posterUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        backdropUrl: 'https://drive.google.com/file/d/1hWYEMA8bkFiFthDBmb8TPHc9B53Eb2V6/view?usp=drive_link',
        rating: 4.4,
        releaseYear: 2011,
        categories: ['Sci-Fi', 'Drama'],
        duration: '60 min',
        isOriginal: true,
      ),
    ];
  }

  List<ContentEntity> _getRecentContent() {
    return [
      ContentEntity(
        id: '16',
        title: 'The Mandalorian',
        description: 'The travels of a lone bounty hunter in the outer reaches of the galaxy.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Mandalorian',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.6,
        releaseYear: 2019,
        categories: ['Sci-Fi', 'Action'],
        duration: '40 min',
      ),
      ContentEntity(
        id: '17',
        title: 'Squid Game',
        description: 'Hundreds of cash-strapped players accept a strange invitation to compete in children\'s games.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Squid+Game',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.4,
        releaseYear: 2021,
        categories: ['Thriller', 'Drama'],
        duration: '55 min',
        isOriginal: true,
      ),
      ContentEntity(
        id: '18',
        title: 'Loki',
        description: 'The mercurial villain Loki resumes his role as the God of Mischief in a new series.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Loki',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.2,
        releaseYear: 2021,
        categories: ['Fantasy', 'Adventure'],
        duration: '50 min',
      ),
      ContentEntity(
        id: '19',
        title: 'Foundation',
        description: 'A complex saga of humans scattered on planets throughout the galaxy.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Foundation',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.0,
        releaseYear: 2021,
        categories: ['Sci-Fi', 'Drama'],
        duration: '60 min',
      ),
      ContentEntity(
        id: '20',
        title: 'Invincible',
        description: 'An adult animated series based on the comic of the same name.',
        posterUrl: 'https://via.placeholder.com/300x450?text=Invincible',
        backdropUrl: 'https://via.placeholder.com/1920x1080',
        rating: 4.7,
        releaseYear: 2021,
        categories: ['Animation', 'Action'],
        duration: '45 min',
      ),
    ];
  }
}