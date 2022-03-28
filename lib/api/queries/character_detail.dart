const characterDetailQuery = r'''
  query($id: ID!) {
    character(id: $id) {
      name
      gender
      image
      status
      episode{
        id
        name
        episode
      }
    }
  }
''';
