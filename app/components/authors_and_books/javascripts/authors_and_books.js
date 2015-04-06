{
  initComponent: function () {
    this.callParent(); // Ext JS requires this

    this.netzkeGetComponent('authors').on('rowclick', function(grid, record) {
      // call the "server_set_author" endpoint of the server side
      this.serverSetAuthor({author_id: record.getId()});

      // inform the client-side of the Books grid to reload itself
      this.netzkeGetComponent('books').getStore().load();
    }, this);
  }
}
