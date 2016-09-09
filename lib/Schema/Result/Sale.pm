use utf8;
package Schema::Result::Sale;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Sale

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<sale>

=cut

__PACKAGE__->table("sale");

=head1 ACCESSORS

=head2 sale_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "sale_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);

=head1 PRIMARY KEY

=over 4

=item * L</sale_id>

=back

=cut

__PACKAGE__->set_primary_key("sale_id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-08-25 17:43:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qhpnIGtS3UuLFm9bhj3zvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
