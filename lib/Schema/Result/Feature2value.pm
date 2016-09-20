use utf8;
package Schema::Result::Feature2value;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Schema::Result::Feature2value

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<feature2value>

=cut

__PACKAGE__->table("feature2value");

=head1 ACCESSORS

=head2 feature2value_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 feature_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 default

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

0 - íåò
1 - äà

=head2 value

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "feature2value_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "feature_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "default",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "value",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</feature2value_id>

=back

=cut

__PACKAGE__->set_primary_key("feature2value_id");

=head1 RELATIONS

=head2 product2feature2values

Type: has_many

Related object: L<Schema::Result::Product2feature2value>

=cut

__PACKAGE__->has_many(
  "product2feature2values",
  "Schema::Result::Product2feature2value",
  { "foreign.feature2value_id" => "self.feature2value_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-09-19 16:17:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q3z0NChlY/NGcY1QUyucTA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
