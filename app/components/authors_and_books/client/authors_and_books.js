{
  initComponent: function () {
    this.callParent(); // Ext JS requires this

    this.netzkeGetComponent('authors').on('rowclick', function(grid, record) {
      // reconfigure with new author id; whatever gets into this.serverConfig will be accessible on the server side
      this.serverConfig['current_author_id'] = record.getId();

      // inform the client-side of the Books grid to reload itself
      this.netzkeGetComponent('books').netzkeReloadStore();
    }, this);
  }
}
