const characterListQuery = r'''
  query($page: Int!){
    characters(page: $page) {
      info {
        next
      }
      results {
        id
        name
        gender
        image
      }
    }
  }
''';
